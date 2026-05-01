# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=yoctofetch
pkgver=2.0.0
pkgrel=2
pkgdesc="Fast and low footprint system fetch tool for the Linux UAPI"
arch=('aarch64' 'x86_64')
url="https://codeberg.org/Phosphenius/yoctofetch"
license=('CC0-1.0' 'GFDL-1.3-or-later' 'GPL-3.0-or-later')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
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

