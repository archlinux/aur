# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=cups-ocr
pkgver=0.1.2
pkgrel=4
pkgdesc="Print directly to a tiff file which feeds an OCR engine which will output a text file. Modelled after cups-pdf."
arch=('i686' 'x86_64' 'armv7h')
url="http://github.com/t0nedef/cups-ocr/"
license=('GPL2')
install=$pkgname.install
depends=('cups' 'imagemagick' 'tesseract')
source=('https://github.com/t0nedef/cups-ocr/archive/'$pkgver'.tar.gz')
backup=('etc/cups/cups-ocr.conf')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm700 cups-ocr ${pkgdir}/usr/lib/cups/backend/cups-ocr
	install -Dm644 cups-ocr.conf ${pkgdir}/etc/cups/cups-ocr.conf
	install -Dm644 CUPS-OCR.ppd ${pkgdir}/usr/share/cups/model/CUPS-OCR.ppd
	install -Dm755 tiff-ocr ${pkgdir}/usr/bin/tiff-ocr
}
#
md5sums=('1652988a8dc700fc7341573a31ad46cd')
