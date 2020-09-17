# Maintainer: hcra <hcra at u53r dot space>

pkgname=netcalc
pkgver=2.1.6
pkgrel=1
pkgdesc="IP network calculator - Simplified clone of sipcalc with ipcalc looks."
arch=('any')
url="https://github.com/troglobit/netcalc"
license=('GPL3')
source=(https://github.com/troglobit/$pkgname/archive/v$pkgver.tar.gz)
sha1sums=('75628133999dae0604369c0874020469a184d3ae')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./autogen.sh

	./configure --prefix=/usr
	make -j5
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install-strip
}
