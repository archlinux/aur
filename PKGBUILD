# Maintainer: Adrien Folie <folie.adrien@gmail.com>
pkgname=firegrid
pkgver=0.4.1
pkgrel=1
pkgdesc="Click anywhere with only a few key strokes"
arch=("x86_64")
url="https://github.com/foliea/firegrid"
license=("MIT")
depends=("qt5-base" "xdotool")
makedepends=("wget" "crystal" "shards")
source=("https://github.com/foliea/firegrid/archive/$pkgver.tar.gz")
md5sums=('4b85a05a1c10201b61ccd7ed4482346b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
