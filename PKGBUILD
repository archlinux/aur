# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=libdial
pkgver=2.5
pkgrel=1
pkgdesc="library needed by tzclock"
arch=('x86_64')
url="https://theknight.co.uk/"
license=("GPL-3.0-only")
depends=('gtk3')
provides=("$pkgname.so=2-64")
source=("$pkgname-$pkgver.tar.bz2::$url/releases/Source/$pkgname-$pkgver.tar.bz2")
sha256sums=('2b015000c541557e7c5aee67ec2939d74e18c95af39162d9f9f528dfd41fb8c3')

build() {
	cd "$pkgname-$pkgver/"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver/"
	make DESTDIR="${pkgdir}" install
}
