# Submitter: Thomas Dziedzic < gostrc-ala-gmail.com >
# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
pkgname=xylib
pkgver=1.5
_tag="v1.5"
_devel="wojdyr"
pkgrel=3
pkgdesc="Portable C++ library for reading files that contain x-y data
from powder diffraction, spectroscopy or other experimental methods."
url="http://xylib.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=("wxgtk")
makedepends=('boost')
options=('!libtool')
source=("https://github.com/$_devel/$pkgname/releases/download/$_tag/$pkgname-$pkgver.tar.bz2")
md5sums=('398d0e04fc50b231b5214a5196765d70')
build() {

  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install || return 1
}
