# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ethstatus
pkgver=0.4.8
pkgrel=1
pkgdesc='A simple program for displaying commonly needed/wanted statistics in real time of incoming and outgoing traffic'
arch=('i686' 'x86_64')
url='http://packages.qa.debian.org/e/ethstatus.html'
license=('GPL')
depends=('ncurses')
source=("http://ftp.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('9a3c466e6b940fb7dc509fb6363de0220026b81c950c0a7f047d628b0855d01b')

build() {
	cd "${srcdir}/${pkgname}-0.4.3"

	make
}

package() {
	cd "${srcdir}/${pkgname}-0.4.3"

	install -D -m0755 ethstatus "${pkgdir}/usr/bin/ethstatus"
	install -D -m0644 ethstatus.1 "${pkgdir}/usr/share/man/man1/ethstatus.1"
}

