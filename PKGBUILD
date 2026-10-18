# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libcmap
pkgver=0.1
pkgrel=1
pkgdesc="Unicode character data library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libcmap"
license=('custom:ISC')
depends=()
makedepends=(curl)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(a1661248303478f0e66ca2aa456f4d717fd7b5ab9790a6c155e1ccc5ab3499a1)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
