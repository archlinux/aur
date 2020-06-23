# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-retrodream
pkgver=1104
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
_commit=bf4d812daf326c56e99208a4c30acae1475fd701
source=(libretro-retrodream::git+https://github.com/libretro/retrodream.git#commit=${_commit})
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
