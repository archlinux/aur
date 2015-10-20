pkgname=digitemp
pkgver=3.6.0
pkgrel=1
pkgdesc="reading values from 1-wire devices"
arch=(i686 x86_64)
url="https://www.digitemp.com/software.shtml"
license=('GPL')
depends=()
makedepends=('libusb-compat')
optdepends=('libusb-compat: for digitemp_DS2490')
source=("https://www.digitemp.com/software/linux/digitemp-$pkgver.tar.gz")
md5sums=('9be2e48db37920f21925ae6e88f83b84')

build() {
	cd "$pkgname-$pkgver"
	make ds9097 ds9097u ds2490
}

package() {
	cd "$pkgname-$pkgver"
	install -dm0755 $pkgdir/usr/bin
	cp -a digitemp_* $pkgdir/usr/bin/
}
