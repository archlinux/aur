# Maintainer: Afify <hassan[ap]afify[dot]dev>
pkgname=sfm
pkgver=0.4
pkgrel=3
pkgdesc="simple file manager for unix-like systems"
arch=('x86_64')
url='https://github.com/afify/sfm'
license=('ISC')
depends=('glibc')
makedepends=('clang')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0fe7f36a4050256b68c6e6c5cb3b7065527c6a8f6a1b0ca020814a7d511c652')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
