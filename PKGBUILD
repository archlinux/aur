# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.5.0'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('05cd0eda59fe1afb4b2254c5a7f451ca891e87c66093ae809c436d36d682683d')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
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

