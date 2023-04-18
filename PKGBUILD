# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=trurl
pkgver=0.5
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=(x86_64)
url="https://github.com/curl/trurl"
license=(custom)
depends=(curl)
source=("https://github.com/curl/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('b5c5600cd3533e208b720f13aa06de724270d1750406b41a22f48ce95c51844d')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install

    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
