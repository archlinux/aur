pkgname=pasmotd
pkgver=1.0.0
pkgrel=1
pkgdesc="Program to output an ANSI-Formatted MOTD in console"
arch=('x86_64')
url="https://github.com/FelixEcker/pasmotd"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('601e11eadb3173471ee879786a781a439126e7b1672caff24ded58d09c9cf3d5')

build() {
	cd "$pkgname-$pkgver"
	echo ":: Make sure you have fpc 3.2.2 or newer installed."
	rm -rf out
        mkdir out
        fpc pasmotd.pas -O4 -FE"out/"
        cp out/pasmotd ./pasmotd
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 pasmotd -t "$pkgdir/usr/bin/"
}
