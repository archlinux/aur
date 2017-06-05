# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=pupnp
pkgver=1.8.1
pkgrel=1
pkgdesc="Portable SDK for UPnP* Devices (libupnp)"
arch=(i686 x86_64 armv7h)
url="https://github.com/mrjimenez/pupnp"
license=('GPL2')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrjimenez/pupnp/archive/release-$pkgver.tar.gz")
sha256sums=('0569e6afd979baa4e533312cb682394cea5b2638b8b412623e28943103593ea0')

build() {
	cd "$pkgname-release-$pkgver"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-release-$pkgver"
	make DESTDIR="$pkgdir/" install
}
