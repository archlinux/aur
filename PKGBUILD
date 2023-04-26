# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=trurl
pkgver=0.6
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=(x86_64)
url="https://github.com/curl/trurl"
license=(custom)
depends=(curl)
checkdepends=(python)
source=("https://github.com/curl/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('4564dff7441d33a29aa02fe64bea7ef0809d9fabc1609ac5b50ca5503e81caa6')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgname-$pkgver"

	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
