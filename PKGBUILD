# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=objectively-git
pkgver=r331.170d201
pkgrel=1
pkgdesc="Ultra-lightweight object oriented framework for GNU C."
arch=('i686' 'x86_64')
url="https://github.com/jdolan/Objectively"
license=('zlib')

makedepends=('git' 'clang' 'autoconf' 'automake' 'check')

source=(git://github.com/jdolan/Objectively)
sha1sums=('SKIP')

build() {
	cd Objectively
	autoreconf -i
	./configure --prefix=/usr
	make
}

pkgver() {
	cd Objectively
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd Objectively
	make DESTDIR="${pkgdir}" install
}
