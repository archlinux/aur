# Maintainer: Tomasz Paś <kierek93@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-xrick-git
_gitname=xrick-libretro
pkgver=88.460fc1d
pkgrel=1
pkgdesc="libretro port of xrick"
arch=('i686' 'x86_64')
url="https://github.com/libretro/xrick-libretro"
license=('GPLv2')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/xrick_libretro.info")
groups=('libretro')

md5sums=('SKIP'
	 'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${srcdir}/xrick_libretro.info" "${pkgdir}/usr/share/libretro/info/xrick_libretro.info"
  install -Dm644 "${_gitname}/xrick_libretro.so" "${pkgdir}/usr/lib/libretro/xrick_libretro.so"
}
