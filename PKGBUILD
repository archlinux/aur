# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.24.0
pkgrel=2
pkgdesc="Go support for Google's protocol buffers"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD')
depends=('protobuf')
makedepends=('go')
source=("https://github.com/protocolbuffers/protobuf-go/archive/v${pkgver}.tar.gz")

build() {
  cd protobuf-go-${pkgver}
  go build -trimpath ./cmd/protoc-gen-go
}

package() {
  install -Dm755 "protobuf-go-${pkgver}/protoc-gen-go" "${pkgdir}/usr/bin/protoc-gen-go"
}

sha256sums=('318e54ee12d09e9c76fc11cf85f6297360e6444b74a6a7882450501bb952ba56')
