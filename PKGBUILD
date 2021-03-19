# Maintainer: Daniel Menelkir <menelkir@itroll.org>

pkgname=libretro-crocods-git
pkgver=75.86eeccf
pkgrel=1
pkgdesc="libretro implementation of Amstrad CPC."
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-crocods"
license=('MIT')
groups=('libretro')
makedepends=('git')

_libname=crocods_libretro
_gitname=libretro-crocods
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
