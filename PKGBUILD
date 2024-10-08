# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=timeprefix
pkgver=3.1
pkgrel=1
pkgdesc="Prefix each line with the time it as written"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/timeprefix"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(fe17271ad25f7726e5737a013bcd7a8f24859ee54c97789385fede53ecd5eacd)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
