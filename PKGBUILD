# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.14.0'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('4ba305c08c4f51851003c7628ed6a30c8c5b78dc7d66446213273bb153ffea45')

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

