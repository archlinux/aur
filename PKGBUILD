# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-px68k-git
pkgver=241.c36fafd
pkgrel=1
pkgdesc="Portable SHARP X68000 Emulator for PSP, Android and other platforms"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/px68k-libretro"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=px68k_libretro
_gitname=px68k-libretro
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
