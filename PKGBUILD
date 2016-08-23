# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# https://github.com/aur-archive/kradio

pkgname=kradio
pkgver=4.0.8
pkgrel=1
pkgdesc='Comfortable KDE internet and AM/FM radio application'
arch=('i686' 'x86_64')
url='http://kradio.sourceforge.net/'
license=('GPL2')
depends=('kdebase-runtime' 'lirc-utils' 'libmms' 'ffmpeg')
makedepends=('automoc4' 'cmake' 'boost')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/${pkgname}/kradio4-${pkgver}.tar.bz2")
sha256sums=('b6a0354ee0d8a69700b95428cf305940d00ff67c1a3268e8fdd9852bbacc000e')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake "../${pkgname}4-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
