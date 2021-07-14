# Maintainer: Jonathon Fernyhough <jonathon_at m2x.dev>

pkgname=pacapt
pkgver=3.0.3
pkgrel=1
pkgdesc='A pacman-like shell wrapper for many package managers'
arch=('any')
url=https://github.com/icy/pacapt
license=(custom)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('52dc3bb495350b98992ab2fd13d8bf12fdfc9165f390479e046127f13efa86886a320965cad9b520a44361d7c2720a1514bddc5772ee6cee1bc0b15e737e1790')

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
