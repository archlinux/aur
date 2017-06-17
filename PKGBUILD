# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=setutils
pkgver=1.0.0
pkgrel=1
pkgdesc="Commandline utilities for working with sets (difference, union, intersection) and shared library (C/C++) "
arch=('i686' 'x86_64')
license=('LGPLv3')
url="http://github.com/kata198/setutils"
makedepends=('glib2')
depends=('glib2')
source=("https://github.com/kata198/setutils/archive/${pkgver}.tar.gz")
sha512sums=("4ff071913ce1da2ab93b6701b77056dc2af8a421aa47939368d3b1eb313075a8bde014eeb12084667bcc045d4e8b54fec06d3632a35cbf4a5dbc775cd1d23532")

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  make V=1
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  make install DESTDIR="${pkgdir}/usr"
}
