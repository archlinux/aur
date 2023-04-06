# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=trurl
pkgver=0.3
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=(x86_64)
url="https://github.com/curl/trurl"
license=(custom)
depends=(curl)
source=("https://github.com/curl/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('708d3bb95463ae160765d4197bbab3a708f9356f70ea9d1334840fdd4f5796eb')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install

    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
