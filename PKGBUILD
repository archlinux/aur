pkgname=pasfetch
pkgver=1.2.3
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('x86_64')
url="https://github.com/FelixEcker/pasfetch"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0535e465c5268b6d1fab028962dadce90d6f415b48b955568f1b854f8786db80')

build() {
	cd "$pkgname-$pkgver"
	sh build.sh
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 out/pasfetch -t "$pkgdir/usr/bin/"
}
