# maintainer: libele <libele@disroot.org>

pkgname=gcc34-bin
pkgver=3.4.6.4.1
_rpmver="3.4.6-4.1"
pkgrel=3
pkgdesc="Compatibility GNU Compiler Collection."
arch=('i386' 'x86_64')
url="https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/repoview/compat-gcc-34.html"
license=('GPL2' 'LGPL')
options=(!strip)
provides=('gcc34')
depends=('libf2c')
makedepends=('rpmextract')
source_i386=("https://linuxsoft.cern.ch/cern/slc5X/i386/yum/updates/compat-gcc-34-${_rpmver}.i386.rpm")
source_x86_64=("https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/compat-gcc-34-${_rpmver}.x86_64.rpm")
md5sums_i386=('75f5ec691a739ce7228fcac872bc25a0')
md5sums_x86_64=('39584eda9be14f39194f8961482cf25c')
noextract=("compat-gcc-34-${_rpmver}.${CARCH}.rpm")

prepare() {
  cd "${srcdir}"
  rpmextract.sh "compat-gcc-34-${_rpmver}.${CARCH}.rpm"
}

package() {
  cd "${srcdir}"
  mv usr "${pkgdir}"/usr
  cd "${pkgdir}"/usr/share/doc
  mv compat-gcc-34-3.4.6 gcc-34
}
