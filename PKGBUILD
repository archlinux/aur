pkgname=digitemp
pkgver=3.7.1
pkgrel=1
pkgdesc="reading values from 1-wire devices"
arch=(i686 x86_64)
url="https://www.digitemp.com/software.shtml"
license=('GPL')
depends=()
makedepends=('libusb-compat')
optdepends=('libusb-compat: for digitemp_DS2490')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcl/digitemp/archive/v$pkgver.tar.gz")
sha256sums=('6fa4d965350d5501b6ca73ee8a09276ca4f65b6d85dae62f0a796239bae5000e')

build() {
	cd "$pkgname-$pkgver"
	make ds9097 ds9097u ds2490
}

package() {
	cd "$pkgname-$pkgver"
	install -dm0755 $pkgdir/usr/bin
	cp -a digitemp_* $pkgdir/usr/bin/
}
