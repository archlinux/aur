# Maintainer: kyledolichev

pkgname=mupen64plus-audio-sdl2
pkgver=1.0
pkgrel=1
pkgdesc="Mupen64plus SDL2 audio plugin"
url="https://github.com/m64p/mupen64plus-audio-sdl2"
arch=('x86_64')
license=('GPL2')
depends=('gcc-libs' 'mupen64plus' 'sdl2')
makedepends=('pkg-config' 'sdl2')
source=("git+https://github.com/m64p/mupen64plus-audio-sdl2.git")
md5sums=('SKIP')
build() {
	make -C ${srcdir}/${pkgname}/projects/unix PREFIX=/usr all
}
package() {
	make -C ${srcdir}/${pkgname}/projects/unix PREFIX=/usr DESTDIR="${pkgdir}" install
}
