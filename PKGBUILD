# Maintainer: Ashley Chiara <ashley@kira64.xyz>
pkgname=yafetch-git
pkgver=2
pkgrel=1
pkgdesc='yet another fetch, written in C++'
arch=('x86_64')
url='https://git.kira64.xyz/yafetch'
license=('MIT')
makedepends=('git' 'make' 'gcc')
backup=()
source=('git+git://git.kira64.xyz/yafetch.git'
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
