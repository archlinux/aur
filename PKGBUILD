# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
pkgname=oosbuild
pkgver=3.0
pkgrel=1
pkgdesc="Build an autoconf project out of source"
arch=(any)
url="https://github.com/BPaden/oosbuild"
license=('GPL2')
depends=('python' 'python-docopt')
source=("https://github.com/BPaden/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('422f38f68a77277533c2dec99a050fcdb0d9b85bb87e1fc0fb7c39a7863b725f')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
