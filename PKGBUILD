# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=genimage
pkgver=13
pkgrel=1
pkgdesc="tool to generate multiple filesystem and flash images from a tree"
arch=("x86_64")
url="https://github.com/pengutronix/genimage"
license=("GPL2")
depends=("confuse")

source=("$pkgname-$pkgver.tar.gz::https://github.com/pengutronix/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c9f5c5c48a98c72d358cd18aca46e69a74c9eeaef6ee4a2497b4c1d2bee467e2')

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
