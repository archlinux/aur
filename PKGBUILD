pkgname=pasfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('x86_64')
url="https://github.com/FelixEcker/pasfetch"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('05b2c6999385c8a80cda51cf2f7f85bbbfcf61c29834ab02a13b910852e9936a')

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
