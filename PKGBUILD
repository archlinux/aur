# Maintainer:  Benjamin Hodgetts <ben@xnode.org>

_libname=mednafen_pcfx_libretro
_gitname=beetle-pcfx-libretro
pkgname=libretro-beetle-pcfx-git
pkgver=r767.84b7ca6
pkgrel=1
pkgdesc="Mednafen PCFX libretro core (NEC PC-FX)."
arch=('i686' 'x86_64')
url="https://github.com/libretro/beetle-pcfx-libretro"
license=('GPLv2')
groups=('libretro')
depends=('libretro-core-info')
makedepends=('git')
groups=('libretro')
provides=('libretro-beetle-pcfx')
conflicts=('libretro-beetle-pcfx')
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
