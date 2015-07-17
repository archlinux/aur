# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
pkgname=oosbuild
pkgver=1.0
pkgrel=1
pkgdesc="Build an autoconf project out of source"
arch=(any)
url="https://github.com/BPaden/oosbuild"
license=('GPL2')
depends=('python' 'python-docopt')
source=("https://github.com/BPaden/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8ace8d822c8ff2c51f9f58eacc65caac98060253fce3026b9df0352895b33a28')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
