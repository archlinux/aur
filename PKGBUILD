# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=slinktool
pkgver=4.3
pkgrel=2
pkgdesc="The all-in-one SeedLink client for data stream inspection, data collection and server testing."
arch=("x86_64")
url="https://github.com/iris-edu/slinktool"
license=('LGPL3')
depends=('ezxml' 'libslink')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('733a9c3c3a7bb237c871ea0038d637898aebb26b9c7f1fb7b17f9f4b0aa67ef5')

prepare() {
	cd "${pkgname}-${pkgver}/src"
	sed -i 's|^CFLAGS.*||' Makefile
	sed -i 's|^LDFLAGS.*||' Makefile
}

build() {
	cd "${pkgname}-${pkgver}/src"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dt ${pkgdir}/usr/bin/ -m755 slinktool
	install -Dt ${pkgdir}/usr/share/man/man1/ -m644  doc/slinktool.1
}
# vim:set ts=4 sw=4 et:
