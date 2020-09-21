pkgname=kdstatemachineeditor
pkgver=1.2.8
pkgrel=1
arch=(any)
pkgdesc=""
license=("LGPL2.1")
depends=('qt5-declarative' 'qt5-remoteobjects' 'qt5-scxml' 'graphviz')
makedepends=('cmake' 'doxygen' 'qt5-tools')
url="https://github.com/KDAB/KDStateMachineEditor/"
source=("https://github.com/KDAB/KDStateMachineEditor/archive/v${pkgver}.tar.gz")
sha256sums=('cbb3fcec7b5c6d16354aeb6c376c67a6ced32fce7bd937da0d4f591373acd374')

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
