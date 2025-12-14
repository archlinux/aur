# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=angstromfetch
pkgver=v1.2.0
pkgrel=1
pkgdesc="Fast(est) system fetch tool for Linux with a low footprint"
arch=(x86_64)
url="https://codeberg.org/Phosphenius/angstromfetch"
license=('GPL-3.0-or-later')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4ce1a363c13145daaa6563712e033d1911db05da85fbee6182158cd9edcc7595')
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

