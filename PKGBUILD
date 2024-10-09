# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=metar
pkgver=1.3.5
pkgrel=1
pkgdesc="Trivial, yet fully fledged, weather report"
arch=(any)
url="https://codeberg.org/maandree/metar"
license=('custom:ISC')
depends=(sh sed grep curl coreutils python3)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(4d56285a5d6c8d5a50f72fbb2387e09a0ee06361233d2e8b801f4b245e4490d4)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

