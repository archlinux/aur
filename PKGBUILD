# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=timeprefix
pkgver=3.1.2
pkgrel=1
pkgdesc="Prefix each line with the time it as written"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/timeprefix"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c473c23d46ad44947de33a5dc4a8cda3331594fe2c927d6125cb8dfbc1c40585)

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
