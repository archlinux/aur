# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=komodo
pkgver=1.0.0
pkgrel=1
pkgdesc='Kirigami-based todo manager'
arch=('x86_64')
url='https://invent.kde.org/utilities/komodo'
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=(
  gcc-libs
  glibc
  kcolorscheme
  kconfig
  kcoreaddons
  kdbusaddons
  kguiaddons
  ki18n
  kiconthemes
  kirigami
  kirigami-addons
  kitemmodels
  qqc2-desktop-style
  qt6-base
  qt6-declarative
)
makedepends=(
  extra-cmake-modules
  git
  reuse
  vulkan-headers
)
source=("$pkgname-$pkgver::git+https://invent.kde.org/utilities/komodo.git#tag=v${pkgver}")
sha256sums=('73bca8b9a13548dedc0bf5202808f3a6a0c4d402f92bd69fd3b8229b690a0701')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
