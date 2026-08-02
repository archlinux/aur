# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=graphics-creator
pkgver=0.3.0
pkgrel=1
pkgdesc='Create titles and other visual effects'
arch=(x86_64)
url='https://github.com/chocolateimage/graphics-creator'
license=(GPL-3.0-only)
depends=(ffmpeg
         kiconthemes
         ktexteditor
         kwidgetsaddons
         kconfigwidgets
         qt6-base
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
sha256sums=('c24d000a49b604a9cc2d86812f73aeaba574104738dbc047ed1a1a396e47b0d3')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

