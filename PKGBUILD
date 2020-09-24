# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.14.2'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('f8fc3c42f685217722406b92279ccf9de8ee2f1bf7fc2d7b8b818c1158940484')

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

