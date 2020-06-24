# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=protoc-gen-go
pkgver=1.25.0
pkgrel=1
pkgdesc="Go support for Google's protocol buffers"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/protocolbuffers/protobuf-go"
license=('BSD')
depends=('protobuf')
makedepends=('go')
source=("https://github.com/protocolbuffers/protobuf-go/archive/v${pkgver}.tar.gz")

build() {
  cd protobuf-go-${pkgver}
  go build -trimpath -mod=readonly -modcacherw ./cmd/protoc-gen-go
}

package() {
  install -Dm755 "protobuf-go-${pkgver}/protoc-gen-go" "${pkgdir}/usr/bin/protoc-gen-go"
}

sha256sums=('c1c04d6e36c0d0fb6f3374197f9025d7e6df13f38a974098be020617c00fbaf2')
