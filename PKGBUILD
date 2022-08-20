pkgname=pasfetch
pkgver=1.2.0
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('x86_64')
url="https://github.com/FelixEcker/pasfetch"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('78c0496b9b9bcea6c780797e60b95ab37b7f41aeb221a0fb5812c0e59eeb83bf')

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
