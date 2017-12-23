# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-virtualjaguar-git
pkgver=212.2b19495
pkgrel=2
pkgdesc="libretro implementation of Virtual Jaguar. (Atari Jaguar)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/virtualjaguar-libretro"
license=('GPL3')
groups=('libretro')
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
