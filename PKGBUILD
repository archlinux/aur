pkgname=pasfetch
pkgver=2.0.0
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('any')
url="https://github.com/MarieEckert/pasfetch"
license=('ISC')
makedepends=('fpc>=3.2.2-5' 'asciidoctor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('50eace5446dec2a766e0beca868df96d18ff02e09bba0fbfbc0dd8902b76df64')

build() {
	cd "$pkgname-$pkgver"
	make release -B
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm 0755 ./obj/pasfetch "$pkgdir/usr/bin/pasfetch"
	install -Dm 0644 ./doc/pasfetch.1 "$pkgdir/usr/share/man/man1/pasfetch.1"
	install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
