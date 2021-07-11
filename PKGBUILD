# Maintainer: Jonathon Fernyhough <jonathon_at m2x.dev>

pkgname=pacapt
pkgver=3.0.2
pkgrel=1
pkgdesc='A pacman-like shell wrapper for many package managers'
arch=('any')
url=https://github.com/icy/pacapt
license=(custom)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('365d1e8cae5393fa3a89185b54715d3a64a3f81b723e1721c7e5bfc79f007209f0f9f3fb7701a4d77582e7ddf5227142f0843e94f2358921b6c8910a21644000')

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
