pkgname=pasfetch
pkgver=1.2.1
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('x86_64')
url="https://github.com/FelixEcker/pasfetch"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('481b635a862a361e16ce10269e6b1c05cb6ceae12abd9059ad61000746bf676b')

build() {
	cd "$pkgname-$pkgver"
	echo ":: Make sure you have fpc 3.2.2 or newer installed."
	sh build.sh
}

package() {
	cd "$pkgname-$pkgver"
	mv PasFetch pasfetch
	install -Dm 755 pasfetch -t "$pkgdir/usr/bin/"
}
