import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    //GET /image_resource?scale=2
    app.get("image_resource") { req -> Response in
        let scale: String = req.query["scale"] ?? "3"
        return req.fileio.streamFile(at: "Public/CustomizableOptions\(scale)x.zip")
    }
    //GET /3d_file
    app.get("3d_file") { req -> Response in
        return req.fileio.streamFile(at: "Public/3d_file.zip")
    }

}
