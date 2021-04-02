# Maintainer:  Oliver Jaksch <arch-aur at com-in dot de>

pkgname=libretro-beetle-pce-fast-git
pkgver=1116.ec4fe57
pkgrel=1
pkgdesc='Standalone port of Mednafen PCE Fast to libretro.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/libretro/beetle-pce-fast-libretro'
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
replaces=('libretro-mednafen-pce-fast-git')

_libname=mednafen_pce_fast_libretro
_gitname=beetle-pce-fast-libretro
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
  install -Dm644 "${srcdir}/${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
