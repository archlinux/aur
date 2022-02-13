# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgnunetworker'
pkgver='0.5.0'
pkgrel=1
pkgdesc='Multithreading with GNUnet'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/${pkgname}"
license=('AGPL')
depends=('gettext' 'gnunet')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha512sums=('6c902f399bc5a63fd7c5bcbb92033147beb277f9ba7505b1c0f3bda74665772b522c21bd20585cb21a4b9f1932a6c0cc40e3fe1670821d037f9954a01e86add2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

