pkgname=pasfetch
pkgver=1.3.0
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('any')
url="https://github.com/FelixEcker/pasfetch"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b83b24d6f256a1e9d94fdbceab21eb2627478bc1d674d929ca4898a7e79feba6')

build() {
	cd "$pkgname-$pkgver"
	sh build.sh
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 out/pasfetch -t "$pkgdir/usr/bin/"
}
