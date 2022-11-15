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
sha256sums=('7715eca337877abe180b435494a12d3ec3383a6677fe638724bcd23d84a5841b')
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
