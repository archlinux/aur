# Maintainer: quellen <lodgerz@gmail.com>

pkgname=libretro-uae-git
pkgver=443.be625e3
pkgrel=1
pkgdesc="A port of the Commodore Amiga Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-uae"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'libretro-core-info')
makedepends=('git')

_libname=puae_libretro
_gitname=libretro-uae
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