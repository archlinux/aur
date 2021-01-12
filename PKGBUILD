# Maintainer: saxonbeta <saxonbeta at gmail>
# Contributor: masutu < masutu dot arch at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Cuneyt Unlu <unlucu AT gmail.com>

pkgname=fityk
pkgver=1.3.1
pkgrel=3
pkgdesc="A program for nonlinear fitting of analytical functions to data."
arch=(i686 x86_64)
url="http://fityk.nieto.pl/"
license=('GPL')
depends=('lua52' 'wxgtk2' 'xylib>=1.4')
makedepends=('boost' 'swig')
options=(!libtool)
source=("https://github.com/wojdyr/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('3d88feb96dbdca70fbfb5f8fa994cea01e77723751e5957094ca46a0c6d511fe')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure LUA_INCLUDE=-I/usr/include/lua5.2 LUA=/usr/bin/lua5.2 --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
