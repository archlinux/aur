# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=pdeath
pkgver=1.1.2
pkgrel=1
pkgdesc="Run a command that is killed when its parent exits"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pdeath"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(3dae3078a17b65a9a0b18f2170abe722697894513fc885ec9846c9abf0313302)

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
