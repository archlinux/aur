# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-pokemini-git
pkgver=64.7e731e4
pkgrel=1
pkgdesc="libretro implementation of Pokémon-Mini emu - Obscure nintendo handheld emulator"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/PokeMini"
license=('GPL3')
groups=('libretro')
depends=('glibc')
makedepends=('git')

_libname=pokemini_libretro
_gitname=PokeMini
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

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

