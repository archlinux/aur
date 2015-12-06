# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Woody Gilk aka Shadowhand <woody.gilk@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gmrun
pkgver=0.9.2
pkgrel=6
pkgdesc="A simple program which provides a run program window"
arch=('i686' 'x86_64')
url="http://sf.net/projects/gmrun"
license=('GPL')
depends=('gtk2' 'popt')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
	gcc43.patch)
md5sums=('6cef37a968006d9496fc56a7099c603c'
	 '3a0b69d8c2cac6cfb551b9d235441ecb')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -p0 -i "$srcdir/gcc43.patch"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
