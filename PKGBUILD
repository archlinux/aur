# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.27.0
pkgrel=2
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

sha256sums=('5a928abfdcc7972e92738e7af2b8d1a41f4b2b7511d5b4f4f5b1ce3705668f45')
