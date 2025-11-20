# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=daylight
pkgver=1.3.0
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
b2sums=('fd06fd95f036ae2c986f41149b1f5a2d21935a9f64680460b33daee08b1ef781a8ff6c60afacc73be2c629c221075842bfa4d1335293fccb93ba3b3c3253a427')
# vim:set ts=2 sw=2 et:
