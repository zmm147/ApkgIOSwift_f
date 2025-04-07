// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ApkgIO",
    platforms: [
        .macOS(.v13), .iOS(.v13)
    ],
    products: [
        .library(
            name: "ApkgIO",
            targets: ["ApkgIO"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/readium/ZIPFoundation.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.15.3"),
        .package(url: "https://github.com/facebook/zstd.git", from: "1.5.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ApkgIO",
            dependencies: [
                .product(name: "ReadiumZIPFoundation", package: "ZIPFoundation"), // 明确指定
                .product(name: "SQLite", package: "sqlite.swift"),
                .product(name: "libzstd", package: "zstd"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ]
        ),
        .testTarget(
            name: "ApkgIOTests",
            dependencies: ["ApkgIO"]
        )
    ]
)
