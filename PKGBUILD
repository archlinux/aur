# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=daylight
pkgver=1.1.0
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
b2sums=('8495e4ab18294a5b09aa3e53926ebf3ca7b8e797ed1b269391ab6e1b1f77d26b6f79fbae16f746055a4bedce9775403dd5527c6911cb7e4c208e60b63a0a9a5b')
# vim:set ts=2 sw=2 et:
