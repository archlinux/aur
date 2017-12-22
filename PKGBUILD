# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-dolphin-git
pkgver=r23943.cda77d5d96
pkgrel=1
pkgdesc='Nintendo GC/Wii core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/dolphin'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=('libretro-dolphin')
conflicts=('libretro-dolphin')
source=('libretro-dolphin::git+https://github.com/libretro/dolphin.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-dolphin

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-dolphin/Source/Core/DolphinLibretro

  make
}

package() {
  cd libretro-dolphin/Source/Core/DolphinLibretro

  install -Dm 644 dolphin_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
