//
//  ViewController.swift
//  Swift Weather
//
//  Created by 王科学 on 21/01/2018.
//  Copyright © 2018 wdxxl. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager:CLLocationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if(ios8()){
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
    
    func ios8() -> Bool {
        return UIDevice.current.systemVersion == "11.2.1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[locations.count-1]
        if(location.horizontalAccuracy > 0) {
            print(location.coordinate.latitude, terminator:"\n")
            print(location.coordinate.longitude, terminator:"\n")
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription, terminator:"")
    }
}

