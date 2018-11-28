pkgname=digitemp
pkgver=3.7.2
pkgrel=1
pkgdesc="reading values from 1-wire devices"
arch=(i686 x86_64 armv7h)
url="https://www.digitemp.com/software.shtml"
license=('GPL')
depends=()
makedepends=('libusb-compat')
optdepends=('libusb-compat: for digitemp_DS2490')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcl/digitemp/archive/v$pkgver.tar.gz")
sha256sums=('683df4ab5cc53a45fe4f860c698f148d34bcca91b3e0568a342f32d64d12ba24')

build() {
	cd "$pkgname-$pkgver"
	make ds9097 ds9097u ds2490
}

package() {
	cd "$pkgname-$pkgver"
	install -dm0755 $pkgdir/usr/bin
	cp -a digitemp_* $pkgdir/usr/bin/
}
