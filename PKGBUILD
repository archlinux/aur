# Submitter: Thomas Dziedzic < gostrc-ala-gmail.com >
# Maintainer: Luis Sarmiento < lgsarmientop-ala-unal.edu.co >
pkgname=xylib
pkgver=1.4
_tag="v1.4"
_devel="wojdyr"
pkgrel=3
pkgdesc="Portable C++ library for reading files that contain x-y data from powder diffraction, spectroscopy or other experimental methods."
url="http://xylib.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=("wxgtk")
makedepends=('boost')
options=('!libtool')
source=("https://github.com/$_devel/$pkgname/releases/download/$_tag/$pkgname-$pkgver.tar.bz2")
md5sums=('e6434e8ff897106c9e5b41999794b5ad')
build() {

  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make -j1 || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install || return 1
}
