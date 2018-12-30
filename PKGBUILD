# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-snes9x-git
pkgver=r1396.83c82eb
pkgrel=1
pkgdesc='Super Nintendo Entertainment System core'
arch=(x86_64)
url='https://github.com/libretro/snes9x'
license=(
  custom
  GPL2
  LGPL2.1
)
groups=(libretro-unstable)
depends=(libretro-core-info)
makedepends=(git)
provides=(libretro-snes9x)
conflicts=(libretro-snes9x)
source=(libretro-snes9x::git+https://github.com/libretro/snes9x.git)
sha256sums=(SKIP)

pkgver() {
  cd libretro-snes9x

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-snes9x/libretro

  make
}

package() {
  cd libretro-snes9x/libretro

  install -Dm 644 snes9x_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 ../LICENSE -t "${pkgdir}"/usr/share/licenses/libretro-snes9x-git/
}

# vim: ts=2 sw=2 et:
