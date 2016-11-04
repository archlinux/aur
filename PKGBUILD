# Maintainer: Josh Klar <j@iv597.com>
pkgname=silentarmy
pkgver=3
pkgrel=1
pkgdesc="GPU Zcash Equihash solver"
arch=('i686' 'x86_64')
url="https://github.com/mbevand/silentarmy"
license=('MIT')
groups=()
depends=('libcl' 'libsodium' 'opencl-headers')
source=("https://github.com/mbevand/silentarmy/archive/v3.tar.gz")
sha256sums=('0143966902d30a9edd1f6c4867d9a6b1d07596eb4773aa4cf93a10b8eb532457')

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
