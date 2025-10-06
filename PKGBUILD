# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kretro
pkgver=0.0.1
pkgrel=2
pkgdesc='Libretro emulation frontend for Plasma'
arch=(x86_64)
url='https://apps.kde.org/kretro/'
license=(GPL-2.0-or-later)
depends=(glibc
         kconfig
         kcoreaddons
         ki18n
         kiconthemes
         kirigami
         kirigami-addons
         qqc2-desktop-style
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-multimedia
         qt6-svg
         sdl3
         gcc-libs)
makedepends=(extra-cmake-modules
             vulkan-headers)
optdepends=('libretro-blastem: support for Sega Mega Drive'
            'libretro-gearsystem: support for Sega MS/GG/SG-1000'
            'libretro-mgba: support for Nintendo Game Boy Advance'
            'libretro-nestopia: support for Nintendo Entertainment System'
            'libretro-snes9x: support for Super Nintendo Entertainment System')
source=(https://download.kde.org/unstable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('51e87cf9e4e8f68e6cd5f79b2147c8cbc28f3cf398882f288049afd9c7142828')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
