# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=trurl
pkgver=0.4
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=(x86_64)
url="https://github.com/curl/trurl"
license=(custom)
depends=(curl)
source=("https://github.com/curl/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('e78f2397e9e60a73b106c12ef4cfd1fc766f50b36209c38df8a77cda48133e47')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install

    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
