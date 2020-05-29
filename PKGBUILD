# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go-grpc
pkgver=1.24.1
pkgrel=3
pkgdesc="The Go language implementation of gRPC"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/grpc/grpc-go"
license=('Apache 2.0')
depends=('protoc-gen-go')
makedepends=('go' 'git' 'zip') # remove zip when 1.30.0 is out
#source=("https://github.com/grpc/grpc-go/archive/v${pkgver}.tar.gz")
source=("https://github.com/grpc/grpc-go/archive/master.zip")

build() {
  cd grpc-go-master/cmd/protoc-gen-go-grpc
  go build -trimpath .
}

package() {
  install -Dm755 "grpc-go-master/cmd/protoc-gen-go-grpc/protoc-gen-go-grpc" "${pkgdir}/usr/bin/protoc-gen-go-grpc"
}

sha256sums=('SKIP') # add sum when 1.30.0 is out
