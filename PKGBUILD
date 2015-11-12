# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.4.1
pkgrel=1
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d791edb97df1f559875da9c91ec2240c876c489dd88d1f49b45aeed4a762d9b2')

build() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	sed -i 's|/usr/sbin|/usr/bin|g' Makefile

	make
}

package() {
	cd ${srcdir}/MAC-Telnet-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

