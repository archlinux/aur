# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-handy-git
pkgver=228.0c203be
pkgrel=1
pkgdesc="libretro implementation of Handy. (Atari Lynx)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-handy"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=handy_libretro
_gitname=libretro-handy
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
