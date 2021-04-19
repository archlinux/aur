# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libparser
pkgver=1.1
pkgrel=1
pkgdesc="Context-free grammar parsing library"
arch=(x86_64)
url="https://github.com/maandree/libparser"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libparser-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(308b2fbfbb5755d715bda5d4b20469f2b3dfc81bbc990adeae493fa3a043ff9c)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
