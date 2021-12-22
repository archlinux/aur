# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go-grpc
epoch=1
pkgver=1.2.0
pkgrel=1
pkgdesc="gRPC bindings generator for Go language"
arch=("any")
url="https://github.com/grpc/grpc-go"
license=('Apache')
depends=('protoc-gen-go')
makedepends=('go')
source=("https://github.com/grpc/grpc-go/archive/cmd/protoc-gen-go-grpc/v${pkgver}.tar.gz")

build() {
	cd grpc-go-cmd-protoc-gen-go-grpc-v${pkgver}/cmd/protoc-gen-go-grpc
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw
}

package() {
	install -Dm755 "grpc-go-cmd-protoc-gen-go-grpc-v${pkgver}/cmd/protoc-gen-go-grpc/protoc-gen-go-grpc" "${pkgdir}/usr/bin/protoc-gen-go-grpc"
}

sha256sums=('cbca93d6dce724248dfdea6303bf27ed24cc3ed9cf8f7485eb825682eab21284')
