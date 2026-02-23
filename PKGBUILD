# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=metar
pkgver=1.3.6
pkgrel=1
pkgdesc="Trivial, yet fully fledged, weather report"
arch=(any)
url="https://codeberg.org/maandree/metar"
license=('custom:ISC')
depends=(sh sed grep curl coreutils python3)
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6d8d0bb279c7bfbeeb359a3bfa1feb05e093cb7f590bbc243ff3a5f2f2b404f8)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

