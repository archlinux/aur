# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=imageburner
pkgver=0.1.15
pkgrel=2
pkgdesc="Image burner for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url='https://artemanufrij.github.io/'
license=('GPL3')
depends=('libgranite.so' 'gtk3')
makedepends=('cmake' 'vala' 'cmake-modules-elementary-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/imageburner/archive/${pkgver}.tar.gz")
sha256sums=('23e1ef8876f828e9ea0f21305a93754ba6d9185abaa209b0b5fb4ebc7c121648')

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
