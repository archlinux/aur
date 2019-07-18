# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-shaders-slang-git
pkgver=r370.b91c670
pkgrel=1
pkgdesc='Collection of shaders for libretro'
arch=(any)
url=https://www.libretro.com/
license=(GPL3)
groups=(libretro-unstable)
provides=(
  libretro-shaders
  libretro-shaders-slang
)
makedepends=(git)
source=(libretro-shaders-slang::git+https://github.com/libretro/slang-shaders.git)
sha256sums=(SKIP)

pkgver() {
  cd libretro-shaders-slang

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
 make DESTDIR="${pkgdir}" -C libretro-shaders-slang install
}

# vim: ts=2 sw=2 et:
