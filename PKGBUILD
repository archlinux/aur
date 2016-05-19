# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.4.3
pkgrel=1
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8188ff1a49197ff8b544d9a38dc1567ec37bc7cec87616006b8ade8f9e0793bf')

build() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	sed -i 's|/usr/sbin|/usr/bin|g' Makefile

	make
}

package() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

