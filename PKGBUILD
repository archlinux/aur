pkgname=cronutils
pkgver=1.9
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
license=('Apache')
source=("https://github.com/google/$pkgname/archive/version/$pkgver.tar.gz")
md5sums=('75e0c279a56a811e8302d08827fcd9f3')

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
