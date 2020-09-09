# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go-grpc
pkgver=1.32.0
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

sha256sums=('47a991a1d561738839e74803e350a276b4b753ae4af329091cb35ad2a117dcb2')
