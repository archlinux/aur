# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=graphics-creator
pkgver=0.2.0
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
sha256sums=('11505cd8933126c613c1aba5642fd514904495aad123f552f368740a1bbc316b')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

