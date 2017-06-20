# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gps-share
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility to share your GPS device on local network"
arch=('x86_64' 'i686')
url="https://github.com/zeenix/gps-share"
license=('GPL')
depends=('dbus')
makedepends=('cargo' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zeenix/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3af9f03d2be9c55a6f21e1d2360ced00e980d301e54525cf8d9b29ddc426a10e')

build() {
	cd $pkgname-$pkgver
	cargo build --release
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 target/release/gps-share "$pkgdir/usr/bin/gps-share"
}
