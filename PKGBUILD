# Maintainer: masutu < masutu dot arch at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Cuneyt Unlu <unlucu AT gmail.com>

pkgname=fityk
pkgver=1.3.1
pkgrel=0
pkgdesc="A program for nonlinear fitting of analytical functions to data."
arch=(i686 x86_64)
url="http://fityk.nieto.pl/"
license=('GPL')
depends=('lua' 'wxgtk' 'xylib>=1.4')
makedepends=('boost' 'python2-sphinx' 'swig')
options=(!libtool)
install=fityk.install
source=("https://github.com/wojdyr/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('41c9a2589e2eac4317a480b364ff493a')

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
