# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-ticfocuser
pkgver=0.9
pkgrel=1
pkgdesc="3rd party drivers for INDI: TicFocuser-ng"
url="https://github.com/sebo-b/TicFocuser-ng"
license=(GPL3)
arch=(i686 x86_64)
depends=(pololu-tic-software libusbp-1)
makedepends=(cmake)
source=("https://github.com/sebo-b/TicFocuser-ng/archive/v${pkgver}.tar.gz")
sha256sums=('a0a032ba96e5c5cdb484edb5d0692771664b2222ed790c6708968cb00dbf22b1')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../TicFocuser-ng-$pkgver

  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
