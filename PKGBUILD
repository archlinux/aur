pkgname=stargazer
pkgname2=stg
pkgver=2.408
pkgrel=1
pkgdesc="A billing system for small home and office networks"
arch=('any')
url="http://www.$pkgname2.dp.ua"
license=('GPL2')
depends=()
source=("http://www.$pkgname2.dp.ua/download/server/$pkgver/$pkgname2-$pkgver.tar.gz"
)
md5sums=('755d35cc9bfbcf6374b5e2a73638b8f0'
)

prepare() {
	cd "$srcdir/$pkgname2-$pkgver/projects/$pkgname"

	sed 's/.*capture\/ipq_linux//' -i build
}

build() {
	cd "$srcdir/$pkgname2-$pkgver/projects/$pkgname"

	./build
}

package() {
	cd "$srcdir/$pkgname2-$pkgver/projects/$pkgname"

	mkdir -p "$pkgdir/usr/sbin"

	make PREFIX="$pkgdir" install
}
