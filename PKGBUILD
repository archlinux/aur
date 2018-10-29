# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.8.0'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11f705f70b596ad35894d6a98fd586e4555b96b40dd86a4849bd6fffd42569ed')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --noconfigure
	./configure --prefix=/usr CFLAGS='-pedantic -std=c99 -g -O3'

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make

}

check() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make check

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}

