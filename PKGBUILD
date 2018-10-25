# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.7.3'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8e051e5961a132f013ee9fb1265cdf000ad39861344159b4c57b667473a2782d')

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

