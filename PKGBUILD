# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-inspect
pkgver=0.14
pkgrel=1
pkgdesc='Tool to get a human-readable representation of Integrity Measurement Architecture file attributes'
arch=('x86_64')
url='https://github.com/mgerstner/ima-inspect'
license=('GPL2')
depends=('ima-evm-utils')
makedepends=('attr' 'tclap')
source=("https://github.com/mgerstner/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12ba2ca22c03f87830d8cd439bb6909347d9b12fb3f86a5a128ad9e1eef525ca')

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
