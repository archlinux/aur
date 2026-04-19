# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=yoctofetch
pkgver=v2.0.0
pkgrel=1
pkgdesc="Fast system fetch tool for Linux with a low footprint"
arch=(x86_64)
url="https://codeberg.org/Phosphenius/yoctofetch"
license=('GPL-3.0-or-later')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7742cbc55cf4d17efe9cf4461aa46f6ac7fcc1737f025218b4019dbf80ffb38e')
validpgpkeys=()

build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

