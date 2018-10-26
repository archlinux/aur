# Maintainer : Mike Polvere <mic.tjs@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-fceumm-git
pkgver=621.eb17f88
pkgrel=1
pkgdesc="libretro implementation of FCEUmm. (Nintendo Entertainment System)"
groups=('libretro')
arch=('i686' 'x86_64' 'arm' 'armv6h')
_libname=fceumm_libretro
_gitname=libretro-fceumm
url="https://github.com/libretro/${_gitname}"
license=('GPL')
depends=('glibc')
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
