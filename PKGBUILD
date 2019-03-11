# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini-git'
_libname='libconfini'
pkgver='r129.715a2ad'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
provides=('libconfini')
conflicts=('libconfini')
source=("git+https://github.com/madmurphy/${_libname}.git")
md5sums=('SKIP')

pkgver() {

	cd "${_libname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_libname}"
	./autogen.sh --prefix=/usr CFLAGS='-pedantic -std=c99 -g -O2'

}

build() {

	cd "${srcdir}/${_libname}"
	make

}

check() {

	cd "${srcdir}/${_libname}"
	make check

}

package() {

	cd "${srcdir}/${_libname}"
	make DESTDIR="${pkgdir}" install

}

