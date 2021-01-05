# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-virtualjaguar-git
pkgver=257.7889df9
pkgrel=1
pkgdesc="libretro implementation of Virtual Jaguar. (Atari Jaguar)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/virtualjaguar-libretro"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=virtualjaguar_libretro
_gitname=virtualjaguar-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
