# Maintainer: Daniel Menelkir <menelkir@itroll.org>
# Old Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-redream-git
pkgver=r1104.bf4d812d
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=('x86_64')
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

  install -Dm 644 retrodream_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
