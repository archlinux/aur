# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naken_asm
pkgver=2019.11.18
pkgrel=1
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
url=http://www.mikekohn.net/micro/naken_asm.php
license=(GPL3)
arch=(i686 x86_64)
depends=(readline)
conflicts=(naken_asm-git)
_pkgver=${pkgver//./-}
source=("http://www.mikekohn.net/downloads/${pkgname}/${pkgname}-${_pkgver}.tar.gz")
sha512sums=('7be1488c38e09568924ce9b0bf2ed911a9450de2b0ce4c1c06aa589e553e89d86e5033e95b3beb442ee41c3fc5cd50d00b2ef53bc313c779f8fa27b3b56bd472')

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
