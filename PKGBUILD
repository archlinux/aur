# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=trurl
pkgver=0.7
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=(x86_64)
url="https://github.com/curl/trurl"
license=(custom)
depends=(curl)
source=("https://github.com/curl/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('11616a4c3d255ff3347cb8fc65ea4f890526f327800ec556d78e88881e2cbfa7')


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
