# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-retrodream
pkgver=1096
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=(x86_64)
url=https://github.com/libretro/retrodream
license=(GPL2)
groups=(libretro)
depends=(
  libgl
  libretro-core-info
)
makedepends=(
  git
  mesa
)
replaces=(libretro-redream)
source=(libretro-retrodream::git+https://github.com/libretro/retrodream.git#commit=f7814c2f0faaf56a5081b62f660f64c5e123227e)
sha256sums=(SKIP)

pkgver() {
  cd libretro-retrodream

  git rev-list --count HEAD
}

build() {
  make -C libretro-retrodream/deps/libretro
}

package() {
  install -Dm 644 libretro-retrodream/deps/libretro/retrodream_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
