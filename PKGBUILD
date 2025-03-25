# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libgeome
pkgver=1.0
pkgrel=1
pkgdesc="Locate local user's geographical location"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libgeome"
license=('custom:ISC')
depends=()
makedepends=(sed)
source=(libgeome-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(90f6663f5f8b45149e3a3b7f7dcabfc9a5575b96a5630c896cec6235b38e4fa9)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
