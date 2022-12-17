
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=libschrift
pkgver=0.10.2
pkgrel=1
pkgdesc='A lightweight TrueType font rendering library.'
arch=('x86_64')
url='https://github.com/tomolt/libschrift'
license=('ISC')
depends=()
conflicts=('libschrift-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23e98611f0dfc6e22dcf531f2de987042ca5a81864911b4e917fb3218795fae0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="usr/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
