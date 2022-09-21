# Maintainer: Aliaksandr Mianzhynski <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.28.1
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

sha256sums=('df0b3dceeff0e1b6d029e60f076edd0d852cb8f3c2fe4fe3fe40164f16ec9b6b')
