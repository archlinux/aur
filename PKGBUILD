# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=kodaskanna
pkgver=0.2.2
pkgrel=1
pkgdesc='A multi-format 1D/2D code scanner'
arch=(x86_64)
url='https://apps.kde.org/kodaskanna/'
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfigwidgets
  kcoreaddons
  kcrash
  ki18n
  kio
  kservice
  kwidgetsaddons
  kxmlgui
  purpose
  qt6-base
  zxing-cpp
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  ninja
  qt6-multimedia
)
source=("git+https://invent.kde.org/graphics/kodaskanna.git?signed#tag=v$pkgver")
b2sums=(3e0a5cde331839cedcba3db045858b48cafd1aee44cc920d65aa70297067e20b61aed103ccec38b6b6edd84a403295799ce70116324f2dc4368a3616002bc605)
validpgpkeys=(E6EBD6EB0518FE5BCCA5F6A76AACDD263C2CEFD4) # Friedrich W. H. Kossebau <kossebau@kde.org>

build() {
  cmake -S $pkgname -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
