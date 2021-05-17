# Maintainer: Ashley Chiara <PersonaVinny@protonmail.com>
pkgname=yafetch-git
pkgver=1
pkgrel=2
pkgdesc='yet another fetch, written in C++'
arch=('x86_64')
url='https://gitlab.com/cyberkitty/yafetch'
license=('GPL2')
makedepends=('git' 'make' 'clang')
backup=()
source=('git+https://gitlab.com/cyberkitty/yafetch.git'
	'arch.patch')
sha256sums=('SKIP'
	    '7a20081bbc1ad274b7a92a3ae26f8c48d241e2acf095cc0f1977137ec4a81019')

prepare() {
	cd yafetch
	patch -p1 < ../arch.patch
}

build() {
	cd yafetch
	make
}

package() {
	cd yafetch
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
