# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libautomata
pkgver=1.0
pkgrel=1
pkgdesc="Stateful automata-based string matching library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libautomata"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(2d98255861b0ad1e3d3436ae742ff495515548ab7475b5a707e12643b958c5da)


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
