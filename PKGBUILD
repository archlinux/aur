# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
pkgname=systemd-bootchart
pkgver=235
pkgrel=1
pkgdesc='Systemd boot performance graphing tool.'
arch=('x86_64')
url='https://github.com/systemd/systemd-bootchart'
license=('GPL2' 'LGPL2.1')
depends=('libsystemd')
makedepends=('docbook-xsl' 'intltool')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('42aa55fe1d3054ba3c119a4479929913445c48768eb1d36b13db8c6ad1889b81')

build() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib CFLAGS='-g -O0 -ftrapv'
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
# vim:set ts=4 sw=4 et:
