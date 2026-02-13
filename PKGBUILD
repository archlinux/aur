# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=timeprefix
pkgver=3.1.1
pkgrel=1
pkgdesc="Prefix each line with the time it as written"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/timeprefix"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(7aabd53c1f16817fb31b83dc166d35a0279f887dff3076096b3266083905f26f)

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
