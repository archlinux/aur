# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=golinx
pkgver=1.0
pkgrel=1
pkgdesc="A client for linx-server written in Go"
url="https://github.com/mutantmonkey/golinx"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mutantmonkey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a5a0b1ff433d8a9b66b3c9115b574472ffa0aeb8c0e929d19fe67c24a3bc2a53')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GOPATH="$srcdir" go get -v -d
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 golinx "${pkgdir}/usr/bin/golinx"
}

# vim:set ts=2 sw=2 et:
