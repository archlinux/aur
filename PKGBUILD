# Maintainer: Benson Muite <benson_muite at emailplus dot org>

pkgname=mankala-git
pkgver=0.1
pkgrel=1
pkgdesc='Mancala games for KDE'
arch=(x86_64)
url='https://invent.kde.org/srisharanvs/mankala'
license=(GPL-3.0-or-later)
depends=(libgcc
         libstdc++
         ki18n
         kirigami
         mankalaengine
         qtkeychain-qt6
         qt6-multimedia
         qt6-networkauth
         qt6-base)
makedepends=(cmake
             extra-cmake-modules
             git
             qt6-tools)
conflicts=(mankala)
provides=(mankala)
replaces=(mankala)
source=(git+https://invent.kde.org/srisharanvs/mankala.git)
sha256sums=('SKIP')


build() {
  cmake -B build -S mankala \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DQT_VERSION_MAJOR=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

