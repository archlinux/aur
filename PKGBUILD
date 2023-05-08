# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-inspect
pkgver=0.15
pkgrel=1
pkgdesc='Tool to get a human-readable representation of Integrity Measurement Architecture file attributes'
arch=('x86_64')
url='https://github.com/mgerstner/ima-inspect'
license=('GPL2')
depends=('ima-evm-utils')
makedepends=('attr' 'tclap')
source=("https://github.com/mgerstner/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7317bebdc832115703857f8ecf73f88a4f4b5f73170a5b9e5aef87ec16b35024')

build() {
	cd "$pkgname-$pkgver"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
