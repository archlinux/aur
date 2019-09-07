# Maintainer: Tomasz Paś <kierek93@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-pocketcdg-git
_gitname=libretro-pocketcdg
pkgver=48.9705f33
pkgrel=1
pkgdesc="libretro port of pocketcdg, karaoke player"
arch=('i686' 'x86_64')
url="https://github.com/libretro/libretro-pocketcdg"
license=('GPLv2')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git")
groups=('libretro')

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
  install -Dm644 "${_gitname}/pocketcdg_libretro.so" "${pkgdir}/usr/lib/libretro/pocketcdg_libretro.so"
}
