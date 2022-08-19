pkgname=pasfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('x86_64')
url="https://github.com/FelixEcker/pasfetch"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('170050d4108ef3de601293da975940fe3f4b6c85fd21df5e2657a0d08cb7b241')

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
