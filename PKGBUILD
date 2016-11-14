# Maintainer: Josh Klar <j@iv597.com>
pkgname=silentarmy
pkgver=5
pkgrel=1
pkgdesc="GPU Zcash Equihash solver"
arch=('i686' 'x86_64')
url="https://github.com/mbevand/silentarmy"
license=('MIT')
groups=()
depends=('libcl' 'opencl-headers' 'python>=3.3.0')
source=("https://github.com/mbevand/silentarmy/archive/v${pkgver}.tar.gz")
sha256sums=('e0ddad344be97958f5ce257d13203dc0665cb96b3aadeaccb7e6892489cb3508')

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
