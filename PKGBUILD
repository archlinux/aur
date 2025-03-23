# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=daylight
pkgver=1.0.0
pkgrel=1
pkgdesc="a command-line program for tracking sunrise and sunset times"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jbreckmckye/daylight"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=("go")
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
b2sums=('d88212142962160a0ebdcf0de725c87ef3c1b086d90df54369b9645e97f04a885630d0f947b1144db38c631dbda647bb975bc844c54689741aac59fc53171261')
# vim:set ts=2 sw=2 et:
