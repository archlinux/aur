# Maintainer: masutu < masutu dot arch at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Cuneyt Unlu <unlucu AT gmail.com>

pkgname=fityk
pkgver=1.3.0
pkgrel=1
pkgdesc="A program for nonlinear fitting of analytical functions to data."
arch=(i686 x86_64)
url="http://fityk.nieto.pl/"
license=('GPL')
depends=('lua' 'wxgtk' 'xylib>=1.4')
makedepends=('boost' 'python2-sphinx' 'swig')
options=(!libtool)
install=fityk.install
source="https://github.com/wojdyr/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2"
md5sums=('d533e0ae646d9066c46b6d90885dc4b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's#sphinx-build#sphinx-build2#' doc/Makefile
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
