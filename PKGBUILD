# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=systemd-bootchart
pkgver=234
pkgrel=1
pkgdesc='Systemd boot performance graphing tool.'
arch=('x86_64')
url='https://github.com/systemd/systemd-bootchart'
license=('GPL2' 'LGPL2.1')
depends=('libsystemd')
makedepends=('docbook-xsl')
source=("https://github.com/systemd/systemd-bootchart/releases/download/v${pkgver}/systemd-bootchart-${pkgver}.tar.xz")
sha256sums=('74b7bcc385a9399cbc17aa86dd5f14425cd85140807f89b0b99008e843b8134b')

build() {
	cd "${srcdir}/systemd-bootchart-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/systemd-bootchart-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
# vim:set ts=4 sw=4:
