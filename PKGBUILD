# Maintainer: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-2048-git
_gitname=libretro-2048
pkgver=122.80d462a
pkgrel=1
pkgdesc="libretro implementation of 2048"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-2048"
license=('GPL' 'LGPL')
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
  install -Dm644 "${_gitname}/2048_libretro.so" "${pkgdir}/usr/lib/libretro/2048_libretro.so"
}
