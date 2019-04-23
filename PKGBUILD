pkgname=kdstatemachineeditor
pkgver=1.2.5
pkgrel=1
arch=(any)
pkgdesc=""
license=("LGPL2.1")
depends=('qt5-declarative' 'qt5-remoteobjects' 'qt5-scxml' 'graphviz')
makedepends=('cmake' 'doxygen' 'qt5-tools')
url="https://github.com/KDAB/KDStateMachineEditor/"
source=("https://github.com/KDAB/KDStateMachineEditor/archive/v${pkgver}.tar.gz")
sha256sums=('b67d27fa5f8ef4f8596490f8569e406d21a16404dfd92f82a5e9b7b37008a5da')

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
