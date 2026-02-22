# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWUK).se>

pkgname=nightshift
pkgver=0.6.2
pkgrel=1
pkgdesc="A terminal user interface for redshift"
arch=(any)
url="https://codeberg.org/maandree/nightshift"
license=('custom:ISC')
depends=(python3 redshift)
makedepends=(zip auto-auto-complete)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(59db76e8bd7486bb548626f1644377475fec73c0b2f1370380349cc9ccadf614)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
