# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go-grpc
epoch=1
pkgver=1.1.0
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

sha256sums=('9aa1f1f82b45a409c25eb7c06c6b4d2a41eb3c9466ebd808fe6d3dc2fb9165b3')
