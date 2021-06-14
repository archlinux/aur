# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.16.1'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('0a8ab12599f17619eb5d44234b019fe9b04d01864cc67c1927189a160b29dbd0')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	./configure --prefix=/usr
	make

}

check() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	make check

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	make DESTDIR="${pkgdir}" install

}

