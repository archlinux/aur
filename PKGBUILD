# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=angstromfetch
pkgver=v1.1.0
pkgrel=1
pkgdesc="Fast(est) system fetch tool for Linux with a low footprint"
arch=(x86_64)
url="https://codeberg.org/Phosphenius/angstromfetch"
license=('GPL-3.0-or-later')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fbef0753a99511cad79c8d0ca523b48fc68f9c9a13baeeb74cb265fe163d7def')
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

