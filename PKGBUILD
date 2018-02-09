pkgname=kdstatemachineeditor
pkgver=1.2.2
pkgrel=1
arch=(any)
pkgdesc=""
license=("LGPL2.1")
depends=('qt5-declarative' 'qt5-remoteobjects' 'qt5-scxml' 'graphviz')
makedepends=('cmake' 'doxygen' 'qt5-tools')
url="https://github.com/KDAB/KDStateMachineEditor/"
source=("https://github.com/KDAB/KDStateMachineEditor/archive/v${pkgver}.tar.gz")
sha256sums=('d616acc9cea6dc6ad4731d3a2fe12e19cf9ce6d3a59b4cd685cf719bd1b82637')

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
