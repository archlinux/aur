# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libparser
pkgver=1.0
pkgrel=1
pkgdesc="Context-free grammar parsing library"
arch=(x86_64)
url="https://github.com/maandree/libparser"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libparser-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(0cc718b25c3675215db8bb5eeb9a3ac6d0e3b7c6bc877c8f432ba4e646648b39)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
