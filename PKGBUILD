# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname='dyncall'
pkgver='0.9'
pkgrel=1
pkgdesc='Calls any plain C function with an argument list created dynamically.'
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url='http://www.dyncall.org/'
license=(custom)
makedepends=('cmake' 'yasm')
source=('http://www.dyncall.org/r0.9/dyncall-0.9.tar.gz')
sha512sums=('ede2698c34daddc14eba3d93ff5f8ac090ba6033f0c75208f51f7ca3286e383e0bc8fd9e4369da2478b0f2e41cac3fe350fbe8fff9b9ab5aecd230d38955ebb4')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ./
	make
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	make DESTDIR="$pkgdir" install
}
