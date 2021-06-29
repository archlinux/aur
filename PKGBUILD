# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.27.1
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

sha256sums=('3ec41a8324431e72f85e0dc0c2c098cc14c3cb1ee8820996c8f46afca2d65609')
