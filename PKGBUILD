# Contributor: daurnimator <quae@daurnimator.com>

pkgname=libarena
pkgver=0.3.7
pkgrel=1
pkgdesc="Custom Memory Allocator Interface"
arch=('i686' 'x86_64')
url='https://25thandclement.com/~william/projects/libarena.html'
license=('MIT')
depends=()
options=()
source=("https://25thandclement.com/~william/projects/releases/${pkgname}-${pkgver}.tgz")
md5sums=('99339b429a34f32267be833a882008b9')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" pic
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
	install -D -m644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
