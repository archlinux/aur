# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=yoctofetch
pkgver=v1.2.0
pkgrel=1
pkgdesc="Fast(est) system fetch tool for Linux with a low footprint"
arch=(x86_64)
url="https://codeberg.org/Phosphenius/yoctofetch"
license=('GPL-3.0-or-later')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e73cbcc3610069eadc58562ccd823ea0b875e944d9e83d80a22c63eb9a7d6a30')
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

