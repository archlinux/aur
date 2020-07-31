# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go-grpc
pkgver=1.31.0
pkgrel=0
pkgdesc="gRPC bindings generator for Go language"
arch=("any")
url="https://github.com/grpc/grpc-go"
license=('Apache')
depends=('protoc-gen-go')
makedepends=('go')
source=("https://github.com/grpc/grpc-go/archive/v${pkgver}.tar.gz")

build() {
	cd grpc-go-${pkgver}/cmd/protoc-gen-go-grpc
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw
}

package() {
	install -Dm755 "grpc-go-${pkgver}/cmd/protoc-gen-go-grpc/protoc-gen-go-grpc" "${pkgdir}/usr/bin/protoc-gen-go-grpc"
}

sha256sums=('9975bd09c992a6fa355da69925aba25957b87b9643bbe62792e928b6355fd805')
