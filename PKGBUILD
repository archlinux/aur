pkgname=sadv
pkgver=1.2.2
pkgrel=1
pkgdesc="CLI Viewer for the SAD format"
arch=('x86_64')
url="https://github.com/FelixEcker/sad"
license=('BSD-3')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7427196846c1380eacf8fa0c80bed1b8d56c545bf7faa89f7f000568dbbfee37')

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
