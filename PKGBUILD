# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=graphics-creator
pkgver=0.6.1
pkgrel=1
pkgdesc='Create titles and other visual effects'
arch=(x86_64)
url='https://github.com/chocolateimage/graphics-creator'
license=(GPL-3.0-only)
depends=(ffmpeg
         kiconthemes
         kwidgetsaddons
         kconfigwidgets
         kcolorscheme
         qt6-base
         qt6-svg
         fontconfig
         qt-advanced-docking-system
         freetype2
         harfbuzz
         libgcc
         glibc
         libstdc++
         hicolor-icon-theme)
makedepends=(extra-cmake-modules pkgconf)
source=($pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/graphics-creator/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('206ad50665161bda78f691acf1f88c0a8cfdc61ff7f496720ffc2b417bca4582')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

