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
  cd chrono
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DEMOS=OFF \
        -DBUILD_ADDITIONAL_TESTS=OFF \
        ..
  make
}

package() {
  cd chrono/build
  make DESTDIR="$pkgdir" install
}

