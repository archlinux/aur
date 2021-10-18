# Maintainer: Ashley Chiara <ashley@kira64.xyz>
pkgname=yafetch-git
pkgver=2
pkgrel=2
pkgdesc='yet another fetch, written in C++'
arch=('x86_64')
url='https://git.kira64.xyz/yafetch'
license=('GPL3')
makedepends=('git' 'make' 'gcc')
backup=()
source=('git+git://git.kira64.xyz/yafetch.git'
	'arch.patch')
sha256sums=('SKIP'
	    '29f511eac93e917148d65dab16466b70ec354671ff2ca396a3225549b3a09c0b')

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
