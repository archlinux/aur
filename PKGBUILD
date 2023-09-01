# Maintainer: First AirBender <noblechuk5[at]web[dot]de>
pkgname=imatix-gsl
pkgver=4.1.4
pkgrel=1
pkgdesc="iMatix GSL code generator"
arch=('x86_64')
url="https://github.com/imatix/gsl"
license=('GPL')
depends=('pcre')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('12c81cf0ede5cf7d16bb91ffb7ee5310ab4adfc438b495960cdf086974e9c8d2')

build() {
	cd "gsl-$pkgver"
	make
}

package() {
	cd "gsl-$pkgver"
	make DESTDIR="$pkgdir" prefix="$pkgdir/usr" install
	mv $pkgdir/usr/bin/{gsl,imatix-gsl}
}
