# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=gentoo
pkgver=0.20.6
pkgrel=1
pkgdesc="A lightweight file manager for GTK"
arch=('i686' 'x86_64')
url="http://www.obsession.se/gentoo/"
license=('GPL2')
depends=('gtk3' 'gamin')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('3532dfc03abacbe06ba6639160ed46d7')

build() {

	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc
	make
	ln -s ${pkgname}-${pkgver}/mkinstalldirs ..

}

package() {

	cd ${srcdir}/${pkgname}-${pkgver}
	make prefix=${pkgdir}/usr sysconfdir=${pkgdir}/etc install

} 
