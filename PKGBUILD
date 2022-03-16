# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Cosku Bas <cosku.bas@gmail.com>

pkgname=objectivelymvc-git
pkgver=r907.f1c4b3c
pkgrel=1
pkgdesc="Object oriented MVC framework for OpenGL, SDL2 and GNU C. Inspired by Apple's AppKit."
arch=('i686' 'x86_64')
url="https://github.com/jdolan/ObjectivelyMVC"
license=('zlib')
makedepends=('git' 'clang' 'autoconf' 'automake' 'check')
depends=('objectively-git' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'fontconfig')
source=(git+https://github.com/jdolan/ObjectivelyMVC)
sha1sums=('SKIP')

pkgver() {
	cd ObjectivelyMVC
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ObjectivelyMVC
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd ObjectivelyMVC
	make DESTDIR="${pkgdir}" install
}
