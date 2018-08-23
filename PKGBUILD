# Maintainer:  Mike Polvere <mic.tjs@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-xrick-git

_gitname=xrick-libretro
_libname=xrick_libretro

pkgver=112.5d5baab
pkgrel=1
pkgdesc="libretro port of xrick"
arch=('i686' 'x86_64')
url="https://github.com/libretro/xrick-libretro"
license=('GPL')
groups=('libretro')
depends=('glibc')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git")
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

