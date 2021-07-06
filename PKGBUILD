# maintainer: libele <libele@disroot.org>

pkgname=gcc34-bin
pkgver=3.4.6.4.1
_rpmver=3.4.6-4.1
pkgrel=1
pkgdesc="Compatibility GNU Compiler Collection."
arch=('x86_64')
url="https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/repoview/compat-gcc-34.html"
license=('GPL2' 'LGPL')
options=(!strip)
provides=('gcc34')
depends=('libf2c')
makedepends=('rpmextract')
source=("https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/compat-gcc-34-${_rpmver}.x86_64.rpm")
md5sums=('39584eda9be14f39194f8961482cf25c')
noextract=("https://linuxsoft.cern.ch/cern/slc5X/x86_64/yum/updates/compat-gcc-34-${_rpmver}.x86_64.rpm")

prepare() {
  cd "${srcdir}"
  rpmextract.sh compat-gcc-34-3.4.6-4.1.x86_64.rpm
}

package() {
  cd "${srcdir}"
  mv usr "${pkgdir}"/usr
  cd "${pkgdir}"/usr/share/doc
  mv compat-gcc-34-3.4.6 gcc-34
}
