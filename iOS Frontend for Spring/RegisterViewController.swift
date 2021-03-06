//
//  RegisterViewController.swift
//  iOS Frontend for Spring
//
//  Created by Xavi Moll Villalonga on 11/05/16.
//  Copyright © 2016 Xavi Moll. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeViewController(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func registerUser(sender: UIBarButtonItem) {
        let bodyHTTP = ["login"         : "\(userNameTextField.text!)",
                        "password"      : "\(passwordTextField.text!)",
                        "langKey"      : "en",
                        "email"         : "\(emailTextField.text!)"]
        
        let headersRequest = ["Content-Type" : "application/json"]
        
        Alamofire.request(.POST, "http://\(Helper().serverIP)/api/register", parameters: bodyHTTP, headers: headersRequest, encoding: .JSON).responseJSON{ response in
            switch response.result {
            case .Success:
                self.dismissViewControllerAnimated(true, completion: nil)
            case .Failure (let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
}
