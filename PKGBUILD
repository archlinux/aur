# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libred
pkgver=1.0.2.1
pkgrel=1
pkgdesc="Solar elevation and blackbody colour calculation library for C"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libred"
license=('ISC')
depends=()
makedepends=(sed)
source=(libred-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(d933e46a41e2c712f7d7c1bb06e17cc8d318160c1812a47c742ceb848f1a064b)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
