# Maintainer: grufo <madmurphy333@gmail.com>

pkgname=libconfini
pkgver=1.3
pkgrel=4
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url="https://madmurphy.github.io/libconfini/"
license=("GPL")
makedepends=('intltool')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz")
md5sums=('d3b2846b161b3e78e8f62c187059b095')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	./autogen.sh
	./configure --prefix=/usr CFLAGS='-g -O3'

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	make DESTDIR="${pkgdir}" install
	chmod +x "${pkgdir}/usr/share/doc/${pkgname}/examples/compile_example_c.sh"
	chmod +x "${pkgdir}/usr/share/doc/${pkgname}/examples/compile_typed_ini_c.sh"

}

