pkgname=kdstatemachineeditor
pkgver=1.2.3
pkgrel=1
arch=(any)
pkgdesc=""
license=("LGPL2.1")
depends=('qt5-declarative' 'qt5-remoteobjects' 'qt5-scxml' 'graphviz')
makedepends=('cmake' 'doxygen' 'qt5-tools')
url="https://github.com/KDAB/KDStateMachineEditor/"
source=("https://github.com/KDAB/KDStateMachineEditor/archive/v${pkgver}.tar.gz")
sha256sums=('929f30fff2ae922f6b617c3e361e78880d5bb1099d2e97d85be6114bc40a1745')

prepare() {
  mkdir -p build
}

build() {
    cd build
    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_TESTING=OFF \
      ../KDStateMachineEditor-${pkgver}
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
