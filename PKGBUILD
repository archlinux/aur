# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=rng
pkgver=1.0
pkgrel=1
pkgdesc='Copy ranges of lines from stdin to stdout'
arch=(x86_64)
url=https://github.com/sjmulder/$pkgname
license=(BSD)
depends=(glibc)
source=($pkgname-$pkgver.tar.gz::https://github.com/sjmulder/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(63f1640b8f18cf3f2271481280c54a2f11aa222bf1424cfde04918711c835e3f)

build() {
	cd $pkgname-$pkgver
	make
}

check() {
	cd $pkgname-$pkgver
	ls | ./rng : >/dev/null
}

package() {
	cd $pkgname-$pkgver
	make install prefix="$pkgdir/usr" man1dir="$pkgdir/usr/share/man/man1"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
}
