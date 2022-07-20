# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=timeprefix
pkgver=3.0.1
pkgrel=1
pkgdesc="Prefix each line with the time it as written"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/timeprefix"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(3102a5869f5c55f74bc9cfbc3447e4471dd38817bb3f66a90ce37de8d6ebe7f6)

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
