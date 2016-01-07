# Author: Jayson Reis <santosdosreis@gmail.com>

pkgname=balde
pkgver=0.1.2
pkgrel=2
pkgdesc="A microframework for C based on GLib and bad intentions."
arch=('x86_64')
url="http://balde.io/"
license=('LGPL2')
depends=('fcgi' 'glib2' 'shared-mime-info' 'peg')
optdepends=('valgrind: debug memory leaks')
source=(https://github.com/balde/balde/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('d73a601479a1b29b26a0722ff2fe8ef38abf0ede04168217c729bb9d7a34915a')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver/"
  make -j1 check
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
