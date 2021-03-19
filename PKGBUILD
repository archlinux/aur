# Maintainer: Daniel Menelkir <menelkir@itroll.org>

pkgname=libretro-beetle-lynx-git
pkgver=r707.c1d9f1e
pkgrel=1
pkgdesc='Atari Lynx core'
arch=('x86_64')
url='https://github.com/libretro/beetle-lynx-libretro'
license=('GPL2')
groups=('libretro-unstable')
depends=('libretro-core-info')
makedepends=('git')
source=("libretro-beetle-lynx::git+https://github.com/libretro/beetle-lynx-libretro.git")
sha256sums=('SKIP')

pkgver() {
  cd libretro-beetle-lynx

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  make -C libretro-beetle-lynx
}

package() {
  install -Dm 644 libretro-beetle-lynx/mednafen_lynx_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

