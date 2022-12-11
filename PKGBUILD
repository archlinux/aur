# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='CP/M 2/3 emulator intended to run Hi-Tech C as cross compiler'
pkgname=zxcc
pkgver=0.5.7
pkgrel=1
url=http://www.seasip.info/Unix/Zxcc
arch=(x86_64)
license=(GPL)
depends=(readline)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
b2sums=('24a657047dd6a7ba46cc3c43a5611be2a97b20bacf5a03c81c3cd53fc12612c2834617cc0be5d73115de1286ab2a3e71cbbb298623ca72b1b7a926f043d3e16f')

build () {
	cd "${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--disable-dependency-tracking \
		--with-readline
	make
}

package () {
	make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
