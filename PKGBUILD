# Maintainer:  Mike Polvere <mic.tjs at gmail dot com>
# Contributor: Griever <coprgriever at gmail dot com>
# Contributor: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-beetle-pce-fast-git
pkgver=916.6dfaf04
pkgrel=1
pkgdesc='Standalone port of Mednafen PCE Fast to libretro.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/libretro/beetle-pce-fast-libretro'
license=('GPL2')
groups=('libretro')
depends=('gcc-libs')
makedepends=('git')

_libname=mednafen_pce_fast_libretro
_gitname=beetle-pce-fast-libretro
replaces=('libretro-mednafen-pce-fast-git')
conflicts=('libretro-mednafen-pce-fast-git')
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
