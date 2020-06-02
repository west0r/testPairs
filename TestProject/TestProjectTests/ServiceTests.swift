//
//  ServiceTests.swift
//  TestProjectTests
//
//  Created by Марина Звягина on 02.06.2020.
//  Copyright © 2020 swDevTeam. All rights reserved.
//

import XCTest
import Combine
@testable import TestProject

protocol ServiceInput {
    
    func obtainPosts() -> AnyPublisher<[Model], Error>
    
}

class ServiceTests: XCTestCase {
    
    var service: ServiceInput!

    override func setUpWithError() throws {
//        service = Service()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDataSucceded() throws {
        let publisher = service.obtainPosts()
        
        let expect = expectation(description: "")
        
        let cancellable = publisher
            .sink(receiveCompletion: { error in
                expect.fulfill()
            }) { (result) in
                    expect.fulfill()
        }


        waitForExpectations(timeout: 3, handler: nil)
    }

}
