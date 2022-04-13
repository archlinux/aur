# Maintainer: Aliaksandr Mianzhynski <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.28.0
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=("any")
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD')
optdepends=('protobuf: protoc generator')
makedepends=('go')
source=("https://github.com/protocolbuffers/protobuf-go/archive/v${pkgver}.tar.gz")

build() {
	cd protobuf-go-${pkgver}
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw ./cmd/protoc-gen-go
}

package() {
	install -Dm755 "protobuf-go-${pkgver}/protoc-gen-go" "${pkgdir}/usr/bin/protoc-gen-go"
}

sha256sums=('e59ae9ace31c3a84bddf1bc3f04a04c498adb9ea7f9fcde60db91bba33d55171')
