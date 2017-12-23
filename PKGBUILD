# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-stella-git
pkgver=193.dfe86f9
pkgrel=2
pkgdesc="libretro implementation of Stella. (Atari 2600)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/stella-libretro"
license=('GPL2')
groups=('libretro')
makedepends=('git')

_libname=stella_libretro
_gitname=stella-libretro
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
