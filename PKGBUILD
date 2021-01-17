
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=lifelines
pkgver=3.1.1
pkgrel=1
pkgdesc='Second generation genealogy software.'
arch=('x86_64')
url="https://github.com/lifelines/$pkgname"
license=('MIT')
conflicts=('lifelines-git')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('083007f81e406fce15931e5a29a7ba0380ef0b3b9c61d5eb5228ad378c7f332d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
