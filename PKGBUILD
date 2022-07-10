# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Woody Gilk aka Shadowhand <woody.gilk@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gmrun
pkgver=1.4w
pkgrel=1
pkgdesc="A simple program which provides a run program window"
arch=('x86_64')
url="https://github.com/wdlkmpx/gmrun"
license=('GPL')
depends=('gtk3' 'popt')
source=($pkgname-$pkgver.tar.gz::https://github.com/wdlkmpx/gmrun/archive/$pkgver.tar.gz)
md5sums=('45b7a88c0dbf2ec4c15f469537eda106')
backup=('etc/gmrunrc')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
