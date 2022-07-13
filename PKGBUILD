# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=libretro-vice-x64-git
pkgver=21069.5ae4a7433
pkgrel=1
pkgdesc="VICE x64 core"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/libretro/vice-libretro"
license=(GPL2)
groups=(libretro)
depends=(gcc-libs zlib libretro-core-info)
makedepends=(git)
provides=(libretro-vice-x64)
conflicts=(libretro-vice-x64)
_gitname=vice-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=(SKIP)

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/vice_x64_libretro.so" "${pkgdir}/usr/lib/libretro/vice_x64_libretro.so"
}
