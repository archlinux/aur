# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.9.2'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4a05fef8bb2b33b367d0d79d9b2b153e3ec84ff725a53e354373408ab231472f')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr CFLAGS='-pedantic -std=c99 -g -O2'

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

