# Maintainer: Aliaksandr Mianzhynski <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.30.0
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=("any")
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD')
optdepends=('protobuf: protoc generator')
#makedepends=('go')
source=("https://github.com/protocolbuffers/protobuf-go/archive/v${pkgver}.tar.gz")

build() {
	cd protobuf-go-${pkgver}
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw ./cmd/protoc-gen-go
}

package() {
	install -Dm755 "protobuf-go-${pkgver}/protoc-gen-go" "${pkgdir}/usr/bin/protoc-gen-go"
}

sha256sums=('3279a16ec3bdd7c53fe1599134de298ed90d9f3b6ec1c1eb5f3b76ba5aaa9f0c')
