pkgname=pasfetch
pkgver=1.2.2
pkgrel=1
pkgdesc="A fetch programm written in Pascal"
arch=('x86_64')
url="https://github.com/FelixEcker/pasfetch"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('df3b553a0106bf4e52cec0c0182f0ede35208a4f511610ff5291077c65da8bec')

build() {
	cd "$pkgname-$pkgver"
	echo ":: Make sure you have fpc 3.2.2 or newer installed."
	sh build.sh
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 out/pasfetch -t "$pkgdir/usr/bin/"
}
