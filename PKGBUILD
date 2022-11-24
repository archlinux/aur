pkgname=sadv
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI Viewer for the SAD format"
arch=('x86_64')
url="https://github.com/FelixEcker/sad"
license=('BSD-3')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4b370eddc6d31e2dc7f9c67c4e33530c3df349e31ade0f50aa20f55b5f0d4997')

build() {
	cd "sad-$pkgver"
	echo ":: Make sure you have fpc 3.2.2 or newer installed."
	mkdir out
        sh build
}

package() {
	cd "sad-$pkgver"
	install -Dm 755 sadv -t "$pkgdir/usr/bin/"
}
