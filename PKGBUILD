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
sha256sums=('8792531992ce1d998987b3744c9ef000851f29c99ff191634018aaaa4f1e58ae')

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

