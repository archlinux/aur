# Maintainer: Benson Muite <benson_muite at emailplus dot org>

pkgname=mankalaengine-git
pkgver=1.1
pkgrel=1
pkgdesc='Engine used for creating computerized opponents for mancala variants'
arch=(x86_64)
url='https://invent.kde.org/games/mankalaengine'
license=(GPL-3.0-or-later)
depends=(libgcc
         libstdc++
         ki18n
         qt6-base)
makedepends=(cmake
             extra-cmake-modules
             git
             qt6-tools)
conflicts=(mankalaengine)
provides=(mankalaengine)
replaces=(mankalaengine)
source=(git+https://invent.kde.org/games/mankalaengine.git)
sha256sums=('SKIP')


build() {
  cmake -B build -S mankalaengine \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTS=OFF \
    -DQT_VERSION_MAJOR=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

