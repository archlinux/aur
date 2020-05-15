# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naken_asm
pkgver=2020.04.25
pkgrel=1
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
url=http://www.mikekohn.net/micro/naken_asm.php
license=(GPL3)
arch=(i686 x86_64)
depends=(readline)
conflicts=(naken_asm-git)
_pkgver=${pkgver//./-}
source=("http://www.mikekohn.net/downloads/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
sha512sums=('dc643631be5c34768ddf69a8c2cb19dbbde570abded4a9fc8bdf79848df4d7a605d35452e9ef5f41b7640aeb463dd1eef4fb1239887bf9733379eb7a83029ec5')

build () {
	cd "${pkgname}-${_pkgver}"
	./configure --install-prefix="${pkgdir}/usr" \
		--include-path="/usr/share/${pkgname}/includes"
	make
}

package () {
	cd "${pkgname}-${_pkgver}"
	make install
}
