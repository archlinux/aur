# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=showmypictures
pkgver=0.3.0
pkgrel=2
pkgdesc="Memories is an photo manager for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/memories"
license=(GPL3)
depends=(libgranite.so gtk3 libgexiv2 sqlite libraw)
makedepends=(vala cmake cmake-modules-elementary-git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/showmypictures/archive/${pkgver}.tar.gz")
sha256sums=('c9d98ffef161f41b6997fe3efe39e84179ec17db40301f8d4075924240efdc1e')

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
  make DESTDIR="${pkgdir}" install
}
