# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-ticfocuser
pkgver=1
pkgrel=1
pkgdesc="3rd party drivers for INDI: TicFocuser"
url="https://github.com/HelgeMK/TicFocuser"
license=(GPL3)
arch=(i686 x86_64)
depends=(pololu-tic-software libusbp-1)
makedepends=(cmake)
source=("${pkgname}::git+https://github.com/HelgeMK/TicFocuser.git")
sha256sums=(SKIP)

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../$pkgname

  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
