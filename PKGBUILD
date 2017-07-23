# Maintainer: Jristz <prflr88@gmail.com>

pkgname=atmel-firmware
pkgver=1.3
pkgrel=5
_atmel=$pkgname-$pkgver.orig
pkgdesc="Firmware and aplications for Atmel at76c5XXx wireless networking chips"
url="http://www.thekelleys.org.uk/atmel"
license=('custom:BSD' 'GPL')
arch=('any')
depends=('perl')
source=("$pkgname.tar.gz::http://ftp.de.debian.org/debian/pool/non-free/a/atmel-firmware/atmel-firmware_1.3.orig.tar.gz"
	"LICENSE")

package(){
	mkdir -p "${pkgdir}/etc/pcmcia"
	mkdir -p "${pkgdir}/usr/lib/firmware"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/doc/$pkgname"
	mkdir -p "${pkgdir}/usr/share/man/man8"
	cp -rav "${srcdir}/$_atmel/images/"*	"${pkgdir}/usr/lib/firmware"
	cp -rav "${srcdir}/$_atmel/images.usb/"* "${pkgdir}/usr/lib/firmware"
	cp -rav "${srcdir}/$_atmel/atmel_fwl.pl" "${pkgdir}/usr/bin/atmel_fwl"
	chmod +x "${pkgdir}/usr/bin/atmel_fwl"
	cp -rav "${srcdir}/$_atmel/atmel_fwl.8"	"${pkgdir}/usr/share/man/man8/atmel_fwl.8"
	cp -rav "${srcdir}/$_atmel/atmel.conf"	"${pkgdir}/etc/pcmcia/atmel.conf"
	cp -rav "${srcdir}/$_atmel/COPYING"	"${pkgdir}/usr/share/doc/$pkgname/COPYING"

	install -Dm644 "${srcdir}/LICENSE"	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('77cb6f8fb9c79241a6892069b38c5081'
         '49aabbea33b520d86e8bfe00d8aeff8f')

