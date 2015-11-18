# Maintainer: Steven Allen <steven@stebalien.com>
pkgname="pbc"
pkgver=0.5.14
pkgrel=1
pkgdesc="a pairing-based cryptography library"
arch=('x86_64' 'i686')
url="https://crypto.stanford.edu/$pkgname/"
license=('LGPL')
depends=('gmp')
source=("$url/files/$pkgname-$pkgver.tar.gz")
sha256sums=('772527404117587560080241cedaf441e5cac3269009cdde4c588a1dce4c23d2')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-optimized
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
