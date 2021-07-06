# maintainer: libele <libele@disroot.org>

pkgname=gcc34-g77-bin
pkgver=3.4.6.4.1
_rpmver="3.4.6-4.1"
pkgrel=3
pkgdesc="Fortran 77 support for compatibility compiler."
arch=('i386' 'x86_64')
url="https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/repoview/compat-gcc-34-g77.html"
license=('GPL2' 'LGPL')
options=(!strip)
provides=('g77')
conflicts=('g77' 'gcc34-g77')
depends=('gcc34' 'libf2c')
makedepends=('rpmextract')
source_i386=("https://linuxsoft.cern.ch/cern/slc5X/i386/yum/updates/compat-gcc-34-g77-${_rpmver}.i386.rpm")
source_x86_64=("https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/compat-gcc-34-g77-${_rpmver}.x86_64.rpm")
md5sums_i386=('af59748bc24ea43f012ca32ef829bd22')
md5sums_x86_64=('cd9ea31ae65f067603eebbf839ca5b17')
noextract=("compat-gcc-34-g77-${_rpmver}.${CARCH}.rpm")

prepare() {
  cd "${srcdir}"
  rpmextract.sh "compat-gcc-34-g77-${_rpmver}.${CARCH}.rpm"
}

package() {
  cd "${srcdir}"
  mv usr "${pkgdir}"/usr
  cd "${pkgdir}"/usr/share/doc
  mv compat-gcc-34-g77-3.4.6 g77
}
