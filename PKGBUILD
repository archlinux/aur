# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=pupnp
pkgver=1.8.2
pkgrel=1
pkgdesc="Portable SDK for UPnP* Devices (libupnp)"
arch=(i686 x86_64 armv7h)
url="https://github.com/mrjimenez/pupnp"
license=('GPL2')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrjimenez/pupnp/archive/release-$pkgver.tar.gz")
sha256sums=('438ad86bfd933cb1e9be1c41bf3bd69f049daba11d71bbb5d715336e00106cb4')

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
