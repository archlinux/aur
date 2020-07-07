# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Woody Gilk aka Shadowhand <woody.gilk@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gmrun
pkgver=0.9.5w
pkgrel=2
pkgdesc="A simple program which provides a run program window"
arch=('x86_64')
url="https://github.com/wdlkmpx/gmrun"
license=('GPL')
depends=('gtk2' 'popt')
source=($pkgname-$pkgver.tar.gz::https://github.com/wdlkmpx/gmrun/archive/$pkgver.tar.gz)
md5sums=('8d7fdf893f15306df9bb9daca6cf897d')
backup=('etc/gmrunrc')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
