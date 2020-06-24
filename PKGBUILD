# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go-grpc
pkgver=1.30.0
pkgrel=3
pkgdesc="gRPC bindings generator for Go language"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/grpc/grpc-go"
license=('Apache')
depends=('protoc-gen-go')
makedepends=('go') 
source=("https://github.com/grpc/grpc-go/archive/v${pkgver}.tar.gz")

build() {
  cd grpc-go-${pkgver}/cmd/protoc-gen-go-grpc
  go build -trimpath -mod=readonly -modcacherw
}

package() {
  install -Dm755 "grpc-go-${pkgver}/cmd/protoc-gen-go-grpc/protoc-gen-go-grpc" "${pkgdir}/usr/bin/protoc-gen-go-grpc"
}

sha256sums=('add9d2c86ea2611a95957ae97c4369c3fc8b381d4c55ca5c0df9daaa220eda54')
