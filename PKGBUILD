# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go-grpc
epoch=1
pkgver=1.0.0
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

sha256sums=('488bb2b4b282b7d4adda32a6534268b2622990d59e2bdadd6f28603638f07116')
