pkgname=chronoengine
pkgver=2.0.0
pkgrel=1
pkgdesc="C++ library for physics simulation"
license=('custom')
arch=('i686' 'x86_64')
url="http://projectchrono.org/chronoengine/"
depends=('gcc-libs')
makedepends=('cmake')
source=("git+https://github.com/projectchrono/chrono.git#tag=${pkgver}")
sha1sums=('SKIP')

build() {
  cd chrono/src
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        ..
  make
}

package() {
  cd chrono/src/build
  make DESTDIR="$pkgdir" install
}

