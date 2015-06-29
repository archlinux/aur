# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ethstatus
pkgver=0.4.3
pkgrel=5
pkgdesc='A simple program for displaying commonly needed/wanted statistics in real time of incoming and outgoing traffic'
arch=('i686' 'x86_64')
url='http://packages.qa.debian.org/e/ethstatus.html'
license=('GPL')
depends=('ncurses')
source=("http://ftp.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('deeecee351dc5cfa309a9130e53ee619a0f0228fc633f60751ad5b2266774399')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m0755 ethstatus "${pkgdir}/usr/bin/ethstatus"
	install -D -m0644 ethstatus.1 "${pkgdir}/usr/share/man/man1/ethstatus.1"
}

