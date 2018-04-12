# Maintainer:  Benjamin Hodgetts <ben@xnode.org>

_libname=bluemsx_libretro
_gitname=blueMSX-libretro
pkgname=libretro-bluemsx-git
pkgver=r223.634f34a
pkgrel=1
pkgdesc="BlueMSX libretro core (Microsoft MSX)."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/blueMSX-libretro"
license=('BSD')
groups=('libretro')
depends=('zlib' 'libretro-core-info')
makedepends=('git')
groups=('libretro')
provides=('libretro-bluemsx')
conflicts=('libretro-bluemsx')
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"
	make
}

package() {
	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
