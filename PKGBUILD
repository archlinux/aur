# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=buf
pkgver=0.18.1
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://buf.build"
license=('Apache')
depends=('protobuf')
makedepends=('go')
source=("https://github.com/bufbuild/buf/archive/v${pkgver}.tar.gz")

build() {
  cd ${pkgname}-${pkgver}
  go build -trimpath -mod=readonly -modcacherw -o . ./cmd/{buf,protoc-gen-buf-check-lint,protoc-gen-buf-check-breaking}
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/buf" "${pkgdir}/usr/bin/buf"
  install -Dm755 "${pkgname}-${pkgver}/protoc-gen-buf-check-lint" "${pkgdir}/usr/bin/protoc-gen-buf-check-lint"
  install -Dm755 "${pkgname}-${pkgver}/protoc-gen-buf-check-breaking" "${pkgdir}/usr/bin/protoc-gen-buf-check-breaking"
}

sha256sums=('2cda10542cc0a23e85f4078ebb9ff02a5635a3e573ea6023ce9b37c0e97a1994')
