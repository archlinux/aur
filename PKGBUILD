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
sha256sums=('9812e5a4eab0bf5adf8c15e1048d57c40772a2c3ea53932064963c06d33e0d1f')

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

