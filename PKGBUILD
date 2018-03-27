# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv
pkgver=0.6.3
pkgrel=1
pkgdesc="Qt5 image viewer with experimental webm playback"
arch=('x86_64' 'i686')
url="https://github.com/easymodo/qimgv"
license=(GPL3)
depends=('qt5-base' 'qt5-imageformats' 'qt5-svg' 'mpv')
makedepends=('cmake' 'qt5-tools')
provides=('qimgv')
conflicts=('qimgv')
source=("https://github.com/easymodo/qimgv/archive/v${pkgver}.tar.gz")
md5sums=('ab8056ccefda185f685fecb86d109e59')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
