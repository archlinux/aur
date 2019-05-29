# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-beetle-dc-git
pkgver=r3636.2af59a87
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=(x86_64)
url=https://github.com/libretro/beetle-dc
license=(GPL2)
groups=(libretro-unstable)
depends=(
  libgl
  libretro-core-info
)
makedepends=(
  git
)
provides=(libretro-beetle-dc)
conflicts=(libretro-beetlc-dc)
source=(libretro-beetle-dc::git+https://github.com/libretro/beetle-dc.git)
sha256sums=(SKIP)

pkgver() {
  cd libretro-beetle-dc

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  make -C libretro-beetle-dc
}

package() {
  install -Dm 644 libretro-beetle-dc/beetledc_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
