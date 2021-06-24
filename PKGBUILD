# Maintainer:  Oliver Jaksch <arch-aur at com-in dot de>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-vba-next-git
pkgver=819.d7b7b6d
pkgrel=1
pkgdesc="libretro implementation of VBA Next. (Game Boy Advance)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/vba-next"
license=('GPL')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=vba_next_libretro
_gitname=vba-next

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
