pkgname=dkms-pl2501
_pkgname=pl2501
pkgver=20121021
pkgrel=2
pkgdesc='DKMS-controlled kernel driver for PL-2501 USB Easy Trasfer Cables'
url='https://patchwork.kernel.org/patch/1227361/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dkms')
makedepends=('linux-headers')

source=('Makefile'
	'dkms.conf'
	'pl2501.c')
md5sums=('c34fe36014409a7522c55b94f831dd5d'
         '2b5ea02f16debbd80827501262ee82ce'
         'e38e2c16893da59ab31889fb8b40c006')

install=pl2501-driver.install

package() {
	cd "${srcdir}"
	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L Makefile ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L dkms.conf ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L pl2501.c ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}
