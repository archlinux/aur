# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=incrtk
pkgver=4.1.0
pkgrel=2
pkgdesc="incr Tk is a framework for building mega-widgets using the [incr Tcl] object system."
url="https://sourceforge.net/projects/incrtcl/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk')
source=("https://sourceforge.net/projects/incrtcl/files/%5Bincr%20Tcl_Tk%5D-4-source/itk%20${pkgver}/itk${pkgver}.tar.gz")

sha256sums=('da646199222efdc4d8c99593863c8d287442ea5a8687f95460d6e9e72431c9c7')

build() {
  cd ${srcdir}/itk${pkgver}
  ./configure --prefix=/usr --with-itcl=`find /usr/lib -name 'itclConfig.sh' | xargs dirname`
  make
}

package() {
  cd ${srcdir}/itk${pkgver}
  make DESTDIR="${pkgdir}" install
}
