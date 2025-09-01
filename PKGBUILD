# Maintainer: Micro <microgamercz@proton.me> -> https://github.com/MicrogamerCz

pkgname=piki-git
pkgver=0.3.2
pkgrel=1
pkgdesc="Unofficial Kirigami client for Pixiv"
arch=(x86_64)
url="https://github.com/MicrogamerCz/Piki"
license=(GPL-3.0-or-later)
depends=(piqi kirigami kirigami-addons ki18n kconfig kwallet purpose futuresql kcoreaddons qt6-webengine)
makedepends=(extra-cmake-modules git)
conflicts=(piki)
provides=(piki)
source=("git+https://github.com/MicrogamerCz/Piki")
sha256sums=('SKIP')

build() {
  cmake -B build -S Piki \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
