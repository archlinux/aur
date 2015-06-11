# Contributor: Dmitry Nosachev - quartz64 at gmail dot com
# Maintainer: N. Izumi - izmntuk
pkgname=ddpt
pkgver=0.95
pkgrel=1
pkgdesc="Variant of the standard 'dd' for SCSI/storage devices"
arch=('i686' 'x86_64')
url="http://sg.danny.cz/sg/ddpt.html"
license=('BSD')
depends=('sg3_utils')
source=(http://sg.danny.cz/sg/p/${pkgname}-${pkgver}.tar.xz)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}/"
	install -d "${pkgdir}/usr/share/"{doc,licenses}/"${pkgname}"
	install -m644 AUTHORS ChangeLog CREDITS README TODO doc/ddpt_examples.txt "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha1sums=('611cd93e6457abc7fc09f63ff7cb6e797ff74abd')
sha256sums=('1bfd63c96d7da65164a7ee5f85c50eefe9bc336709036821d7f456329714669a')
