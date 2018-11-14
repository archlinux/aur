# Maintainer : Mike Polvere <mic.tjs@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-vba-next-git
pkgver=741.e40f1d5
pkgrel=1
pkgdesc="libretro implementation of VBA Next. (Game Boy Advance)"
groups=('libretro')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h') 
_libname=vba_next_libretro
_gitname=vba-next
url="https://github.com/libretro/${_gitname}"
license=('GPL')
depends=('gcc-libs')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
