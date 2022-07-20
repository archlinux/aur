# Submitter: Thomas Dziedzic < gostrc-ala-gmail.com >
# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
pkgname=xylib
pkgver=1.6
_tag="v1.6"
_devel="wojdyr"
pkgrel=2
pkgdesc="Portable C++ library for reading files that contain x-y data
from powder diffraction, spectroscopy or other experimental methods."
url="http://xylib.sourceforge.net/"
arch=('x86_64')
license=('GPL')
depends=("wxgtk3")
makedepends=('boost>=1.46.1')
options=('!libtool')
source=("https://github.com/$_devel/$pkgname/releases/download/$_tag/$pkgname-$pkgver.tar.bz2")
sha256sums=('b641cb33fa01732b8203356e0978384f9551bf415cfbae5989b3a233b3cb0ec7')

build() {

  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install || return 1
}
