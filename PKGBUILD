# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=showmypictures
pkgver=0.2.7
pkgrel=1
pkgdesc="Memories is an photo manager for Pantheon"
arch=('x86_64')
url="http://anufrij.org/memories"
license=('GPL3')
depends=('libgranite.so' 'gtk3' 'libgexiv2' 'sqlite' 'cmake-modules-elementary-git')
makedepends=('vala' 'cmake' 'cmake-modules-elementary-git')
source=("https://github.com/artemanufrij/showmypictures/archive/${pkgver}.tar.gz")
sha256sums=('f9d1699e319934bfb7226fe3de0d924ceabebd7345225d33cca2f4a7b353839a')

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
