# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>

pkgname=libdial
pkgver=2.3
pkgrel=1
pkgdesc="library needed by tzclock"
arch=('x86_64')
url="https://theknight.co.uk/"
license=("GPL3")
depends=('gtk3')
provides=("$pkgname.so=2-64")
source=("$pkgname-$pkgver.tar.bz2::$url/releases/Source/$pkgname-$pkgver.tar.bz2")
sha256sums=('db765995c27c5d59115386938ba10d9ce36accb503dbb348c5f0fdf3d5a5a669')

build() {
	cd "$pkgname-$pkgver/"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver/"
	make DESTDIR="${pkgdir}" install
}
