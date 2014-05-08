# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmfire
pkgver=0.0.3.8
pkgrel=1
pkgdesc="A dock app firey load meter"
arch=('i686' 'x86_64')
url="http://www.zebra.net/~dm/wmfire/"
license=('GPL')
depends=('libxpm')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmfire-0.0.3.8.tar.gz")
md5sums=('026f92098b7096593b7a1dcb0f32709d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: set sw=2 et:
