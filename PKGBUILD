# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=libdial
pkgver=2.2
pkgrel=2
pkgdesc="library needed by tzclock"
arch=('x86_64')
url="https://theknight.co.uk/"
license=("GPL3")
depends=('gtk3')
provides=("$pkgname.so=2-64")
source=("$pkgname-$pkgver.tar.bz2::$url/releases/Source/$pkgname-$pkgver.tar.bz2")
sha256sums=('d6c118f82d3c38117ced415e7345dd88d8f1c30685c41f99f480810b9c82447f')

build() {
	cd "$pkgname-$pkgver/"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver/"
	make DESTDIR="${pkgdir}" install
}
