# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.4.0
pkgrel=4
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2e94e9df3b43ec441626d875becf7ebca335a79170e1fc75373eaeda506f363e')

build() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	sed -i 's|/usr/sbin|/usr/bin|g' Makefile

	make
}

package() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

