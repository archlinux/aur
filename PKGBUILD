# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=incrtk
pkgver=4.1.0
pkgrel=1
pkgdesc="[incr Tk] is a framework for building mega-widgets using the [incr Tcl] object system."
url="https://sourceforge.net/projects/incrtcl/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk')
optdepends=()
makedepends=(make gcc)
conflicts=()
replaces=()
backup=()
install=
source=("https://sourceforge.net/projects/incrtcl/files/%5Bincr%20Tcl_Tk%5D-4-source/itk%20${pkgver}/itk${pkgver}.tar.gz")

md5sums=(600df0a12868507c52d46fd59d4e1c16)

build() {
  cd ${srcdir}/itk${pkgver}
  ./configure --prefix=/usr --with-itcl=`find /usr/lib -name 'itclConfig.sh' | xargs dirname`
  make
}

package() {
  cd ${srcdir}/itk${pkgver}
  make DESTDIR="${pkgdir}" install
}
