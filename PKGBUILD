# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libparser
pkgver=1.0.1
pkgrel=1
pkgdesc="Context-free grammar parsing library"
arch=(x86_64)
url="https://github.com/maandree/libparser"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libparser-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(505722b67013a36f18eeb5ead3f2e7dda3cc6ae27305402c5aa4f987d1c61578)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
