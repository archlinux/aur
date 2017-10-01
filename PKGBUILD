# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.4.1'
pkgrel=2
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
makedepends=('intltool')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8d97819a8757028ee3f16408b9326a85')

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
	chmod +x "${pkgdir}/usr/share/doc/${pkgname}/examples/run_example.sh"

}

