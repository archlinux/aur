# Maintainer:  Mike Polvere <mic.tjs@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-genesis-plus-gx-git
pkgver=1459.7856b72
pkgrel=1
pkgdesc='Sega 8/16 bit emu - Genesis Plus (enhanced) port for libretro (Sega MS/GG/MD/CD)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
_libname=genesis_plus_gx_libretro
_gitname=Genesis-Plus-GX
url="https://github.com/libretro/${_gitname}"
license=('custom')
groups=('libretro')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

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
  	install -Dm644 "${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
} 
