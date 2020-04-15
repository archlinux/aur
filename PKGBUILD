# Maintainer: Dario Pellegrini <pellegrinidario@gmail.com>

pkgname=libretro-bnes
pkgver=1
pkgrel=1
epoch=1
pkgdesc='Nintendo Entertainment System cores'
arch=(x86_64)
url=https://github.com/libretro/bnes-libretro
license=(GPL3)
groups=(libretro)
depends=(
  gcc-libs
  libretro-core-info
)
makedepends=(git)
source=(
  libretro-bnes::git+https://github.com/libretro/bnes-libretro.git#commit=8e26e89a93bef8eb8992d1921b539dce1792660a
)
sha256sums=(
  SKIP
)

pkgver() {
  cd "$pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm 644 bnes_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
