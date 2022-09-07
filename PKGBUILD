# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.4.4
pkgrel=4
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2e6f041c0ff26597e6551cb564a0e41430a6ae183d31eb216493d862733f4c14')

prepare() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	./autogen.sh
}

build() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc

	make
}

package() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

