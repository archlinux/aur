# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ethstatus
pkgver=0.4.9
pkgrel=1
pkgdesc='A simple program for displaying commonly needed/wanted statistics in real time of incoming and outgoing traffic'
arch=('i686' 'x86_64')
url='http://packages.qa.debian.org/e/ethstatus.html'
license=('GPL')
depends=('ncurses')
source=("http://ftp.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('4a85051f9d704c88e770577f18caaf4b97583e622a919dfdc87e0bd6b8166722')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m0755 ethstatus "${pkgdir}/usr/bin/ethstatus"
	install -D -m0644 ethstatus.1 "${pkgdir}/usr/share/man/man1/ethstatus.1"
}

