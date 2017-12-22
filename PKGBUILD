# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-redream-git
pkgver=r1077.e032445a
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/redream'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libgl' 'libretro-core-info')
makedepends=('git')
provides=('libretro-redream')
conflicts=('libretro-redream')
source=('libretro-redream::git+https://github.com/libretro/redream.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-redream

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-redream/deps/libretro

  make
}

package() {
  cd libretro-redream/deps/libretro

  install -Dm 644 redream_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
