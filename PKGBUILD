# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=libretro-vice-x64-git
pkgver=r21108.86eca8b
pkgrel=1
pkgdesc="VICE x64 core"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/libretro/vice-libretro"
license=(GPL2)
groups=(libretro)
depends=(gcc-libs zlib libretro-core-info)
makedepends=(git)
conflicts=(libretro-vice libretro-vice-git)
source=(git+https://github.com/libretro/vice-libretro.git)
sha256sums=(SKIP)

pkgver() {
  cd vice-libretro
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd vice-libretro
  make clean
  make
}

package() {
  install -Dm644 "vice-libretro/vice_x64_libretro.so" "${pkgdir}/usr/lib/libretro/vice_x64_libretro.so"
}
