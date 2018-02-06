# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=qgmailnotifier
pkgver=2014.2
pkgrel=1
pkgdesc="Portable Qt5 based GMail notifier"
arch=(x86_64)
url="https://github.com/eteran/qgmailnotifier"
license=('GPL')
depends=('qt5-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eteran/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('16dd31826ddeb09a4316d55c362a64f9f028f5e72a12dedfe54746f65bbc7226'
            'd3c5dd85d3b7211e877ccce1f3668bdcfa06b48b30a9fb3b3acb62c1c0fc49f6')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/usr" install
	install -Dm644 img/gmail.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
