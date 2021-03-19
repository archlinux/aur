# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.26.0
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=("any")
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD')
depends=('protobuf')
makedepends=('go')
source=("https://github.com/protocolbuffers/protobuf-go/archive/v${pkgver}.tar.gz")

build() {
	cd protobuf-go-${pkgver}
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw ./cmd/protoc-gen-go
}

package() {
	install -Dm755 "protobuf-go-${pkgver}/protoc-gen-go" "${pkgdir}/usr/bin/protoc-gen-go"
}

sha256sums=('26218474bcf776ecf32d7d194c6bfaca8e7b4f0c087e5b595fd50fbb31409676')
