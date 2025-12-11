# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=angstromfetch
pkgver=v1.0.0
pkgrel=1
pkgdesc="Fast(est) system fetch tool for Linux with a low footprint"
arch=(x86_64)
url="https://codeberg.org/Phosphenius/angstromfetch"
license=('GPL-3.0-or-later')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
options=('!lto')
sha256sums=('53e7eddb4f9ed82a3a87e6f342e2609ae5995d2a5cbe897beb24d71fa7614664')
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

