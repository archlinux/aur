# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=daylight
pkgver=1.2.0
pkgrel=1
pkgdesc="a command-line program for tracking sunrise and sunset times"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jbreckmckye/daylight"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jbreckmckye/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver" || exit
	make
}

check() {
	cd "$pkgname-$pkgver" || exit
	make -k test
}

package() {
	cd "$pkgname-$pkgver" || exit
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
b2sums=('e9598d2b72d2c59b4afbd1f42cc23d12cc0d2d22dcae5bb93bd90a5608ca4181500db3d1eb99672719ef93bad6089831479d240d1ff2c1bd4ff85f0d0fc66243')
# vim:set ts=2 sw=2 et:
