# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=trurl
pkgver=0.2
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=(x86_64)
url="https://github.com/curl/trurl"
license=(custom)
depends=(curl)
source=("https://github.com/curl/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('acef7d251fc13fc97153d5d6949b50744a5bad8aa93840b0d8509cd754ed704f')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install

    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
