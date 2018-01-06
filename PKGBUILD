# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=ccrypt
pkgver=1.10
pkgrel=2
pkgdesc='A command-line utility for encrypting and decrypting files and streams'
arch=('x86_64')
url="http://ccrypt.sourceforge.net"
license=('GPL2')
depends=('glibc')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('95d4e524abb146946fe6af9d53ed0e5e294b34e2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
