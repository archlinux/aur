# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Remi Gacogne <rgacogne-arch at coredump dot fr>

set -u
pkgname='ht-editor'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='An open source executable file editing tool that supports the MZ, PE and LE file formats including code analyzer.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/hte/'
license=('GPL')
depends=('ncurses' 'lzo2' 'libx11' 'gcc-libs')
source=("http://sourceforge.net/projects/hte/files/ht-source/ht-${pkgver}.tar.bz2")
sha256sums=('31f5e8e2ca7f85d40bb18ef518bf1a105a6f602918a0755bc649f3f407b75d70')

prepare() {
  set -u
  cd "${srcdir}/ht-${pkgver}"
  ./configure --enable-release
  set +u
}

build() {
  set -u
  cd "${srcdir}/ht-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/ht-${pkgver}"
  install -Dpm755 'ht' -t "${pkgdir}/usr/bin/"
  set +u
}
set +u
