# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=genimage
pkgver=12
pkgrel=1
pkgdesc="tool to generate multiple filesystem and flash images from a tree"
arch=("x86_64")
url="https://github.com/pengutronix/genimage"
license=("GPL2")
depends=("confuse")

source=("$pkgname-$pkgver.tar.gz::https://github.com/pengutronix/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("7912d8cd02b4df2213c60346d3679f74fd3a864117bbbffe2ff74e806d1e236d")

build() {
	cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
