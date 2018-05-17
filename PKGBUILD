# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname='dyncall'
pkgver='1.0'
pkgrel=1
pkgdesc='Calls any plain C function with an argument list created dynamically.'
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url='http://www.dyncall.org/'
license=(custom)
makedepends=('cmake' 'yasm')
source=("http://www.dyncall.org/r${pkgver}/dyncall-${pkgver}.tar.gz")
sha512sums=('3310e17fd2d81ecf21087cc27dfc5780585af8a8ec8f2e5ecc86d26678f17fc6899e7f13aced5205aab7cea656034ca972e3a05e105b68a88bf06b57910e1b97')
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
