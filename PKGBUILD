# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=karp
pkgver=25.03.80
pkgrel=1
pkgdesc='Simple PDF editor to arrange, merge and improve PDF file(s)'
arch=(x86_64)
url='https://apps.kde.org/karp/'
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfig
  kcoreaddons
  kcrash
  ki18n
  kiconthemes
  kirigami
  kirigami-addons
  qpdf
  qt6-base
  qt6-declarative
  qt6-webengine
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  ninja
)
source=("git+https://invent.kde.org/graphics/karp.git#tag=v$pkgver")
b2sums=(326423594893753e6ce49b19acc60e74850d4a8dc61f3bdafe480422d5d302d189f7e84a1d491031b55710f5b4856e0acd060ec16b40673b7d112a31add83a47)

build() {
  cmake -S $pkgname -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
