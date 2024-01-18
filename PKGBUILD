pkgname=cronutils
pkgver=1.10
pkgrel=1
pkgdesc="utilities to assist running batch processing jobs"
url="https://github.com/google/cronutils"
arch=(i686 x86_64)
license=('Apache')
source=("https://github.com/google/$pkgname/archive/version/$pkgver.tar.gz")
md5sums=('0396401998d16b7130b38cce30c0cb55')

build() {
	cd "$pkgname-version-$pkgver"
	make
}

check() {
	cd "$pkgname-version-$pkgver"
	make test
}

package() {
	cd "$pkgname-version-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
