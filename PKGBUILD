# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=objectivelymvc-git
pkgver=r252.dd425fd
pkgrel=1
pkgdesc="Object oriented MVC framework for OpenGL, SDL2 and GNU C. Inspired by Apple's AppKit."
arch=('i686' 'x86_64')
url="https://github.com/jdolan/Objectively"
license=('zlib')

makedepends=('git' 'clang' 'autoconf' 'automake' 'check')
depends=('objectively-git' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'fontconfig')

source=(git://github.com/jdolan/ObjectivelyMVC)
sha1sums=('SKIP')

build() {
	cd ObjectivelyMVC
	autoreconf -i
	./configure --prefix=/usr
	make
}

pkgver() {
	cd ObjectivelyMVC
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ObjectivelyMVC
	make DESTDIR="${pkgdir}" install
}
