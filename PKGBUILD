# Maintainer: Josh Klar <j@iv597.com>
pkgname=silentarmy
pkgver=4
pkgrel=1
pkgdesc="GPU Zcash Equihash solver"
arch=('i686' 'x86_64')
url="https://github.com/mbevand/silentarmy"
license=('MIT')
groups=()
depends=('libcl' 'opencl-headers' 'python>=3.3.0')
source=('https://github.com/mbevand/silentarmy/archive/v4.tar.gz')
sha256sums=('0a0cdd272160d0a00c778b4ffaee9c82f41282bdcd18adc685f781b7dd090fc2')

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	install silentarmy "$pkgdir/usr/bin/"
	install sa-solver "$pkgdir/usr/bin/"
}
