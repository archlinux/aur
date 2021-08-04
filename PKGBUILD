# Maintainer: Jonathon Fernyhough <jonathon_at m2x.dev>

pkgname=pacapt
pkgver=3.0.4
pkgrel=1
pkgdesc='A pacman-like shell wrapper for many package managers'
arch=('any')
url=https://github.com/icy/pacapt
license=(custom)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('dd98120117de40f6ed3dc89be0c106b12e08fe8b5b0e190e9ba50a716c0018049cd814ad4bfee226802468a74bbf771176bee155db6135f45766c197db759cb1')

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
