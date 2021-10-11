# Maintainer: Jonathon Fernyhough <jonathon_at m2x.dev>

pkgname=pacapt
pkgver=3.0.5
pkgrel=1
pkgdesc='A pacman-like shell wrapper for many package managers'
arch=('any')
url=https://github.com/icy/pacapt
license=(custom)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('b5a52a3931d57cabdf532a444957596895f745d39251ebb3ced2a6aacc924d18a81aacc12a30d0a14324f7297a68f004704ccb06bc970fe572f9cef31d04e1ef')

build() {
	make -C $pkgname-$pkgver VERSION=$pkgver pacapt
}

#check() {
#	make -C $pkgname-$pkgver tests
#}

package() {
	cd $pkgname-$pkgver
	install -D     pacapt  "$pkgdir"/usr/bin/pacapt
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
