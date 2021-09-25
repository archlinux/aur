# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libconfini'
pkgver='1.16.2'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('7943bdb7ad84cf817bbb6599d32593a066c49be6d10b06c92cb3bbd5e7f8307e')

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

