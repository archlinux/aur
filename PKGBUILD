# Maintainer:  Lukas Sabota <lukas@lwsabota.com>

_libname=fmsx_libretro
_gitname=fmsx-libretro
pkgname=libretro-fmsx-git
pkgver=r123.8ca1dca
pkgrel=1
pkgdesc="fMSX libretro core (Microsoft MSX)."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/fmsx-libretro"
license=('custom')
groups=('libretro')
depends=('zlib')
makedepends=('git')
groups=('libretro')
source=("git+https://github.com/libretro/${_gitname}.git" "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP' 'SKIP')

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
