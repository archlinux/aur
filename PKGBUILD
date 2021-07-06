# maintainer: libele <libele@disroot.org>

pkgname=gcc34-g77-bin
pkgver=3.4.6.4.1
_rpmver=3.4.6-4.1
pkgrel=1
pkgdesc="Fortran 77 support for compatibility compiler."
arch=('x86_64')
url="https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/repoview/compat-gcc-34-g77.html"
provides=gcc34-g77
license=('GPL2' 'LGPL')
options=(!strip)
provides=('g77')
conflicts=('g77' 'gcc34-g77')
depends=('gcc34' 'libf2c')
makedepends=('rpmextract')
source=("https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/compat-gcc-34-g77-3.4.6-4.1.x86_64.rpm")
md5sums=('cd9ea31ae65f067603eebbf839ca5b17')
noextract=("compat-gcc-34-g77-3.4.6-4.1.x86_64.rpm")

prepare() {
  cd "${srcdir}"
  rpmextract.sh compat-gcc-34-g77-3.4.6-4.1.x86_64.rpm
}

package() {
  cd "${srcdir}"
  mv usr "${pkgdir}"/usr
  cd "${pkgdir}"/usr/share/doc
  mv compat-gcc-34-g77-3.4.6 g77
}
