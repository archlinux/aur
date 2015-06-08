pkgname=dkms-atusb
_pkgname=atusb
pkgver=20130404
pkgrel=1
pkgdesc='DKMS-controlled kernel driver for ATUSB'
url='http://en.qi-hardware.com/wiki/Ben_WPAN'
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
makedepends=('linux-headers')

source=('Makefile'
	'dkms.conf'
	'atusb.c'
	'atusb.h'
	'at86rf230.h')

md5sums=('639ae4639a54696c7e7794af6ebba6a8'
         'f0f770f91074f5dccc155f9d259eae6e'
         'c4dbf3cc9f5c23ef490271ca42df782b'
         'c35d8fb55812511197ca8191a3f8f36e'
	 '6a45527417e98b852109dc8264e7beb3')

install=atusb.install

package() {
	cd "${srcdir}"
	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L Makefile ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L dkms.conf ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L atusb.c ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L atusb.h ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L at86rf230.h ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}
