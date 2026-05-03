# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=orphan-reaper
pkgver=2.3.5
pkgrel=1
pkgdesc="Place subreapers in your process tree to keep it structured"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/orphan-reaper"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4e6f470b61188c6984e694eb17860ee9e7f55ff012e4d8665d6d4e884831d121)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
