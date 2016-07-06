# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kasync
pkgver=4.99.0
pkgrel=1
pkgdesc='A C++ library for controlling asynchronous tasks'
arch=('i686' 'x86_64')
url='https://github.com/KDE/kasync'
license=('GPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
source=("https://obs.kolabsys.com/repositories/Kube:/Winterfell/Fedora_23/src/kasync-4.99.0-2.6.fc23.kube_wf.src.rpm")
sha256sums=('c447b3bfd7a0a8ff5a0937dfd68d85162078cfa8f7256ebc45de3f5951afbee6')

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
