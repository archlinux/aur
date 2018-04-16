# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>

pkgname=rw
pkgver=1.0
pkgrel=2
pkgdesc="Blockwise input/output"
arch=('x86_64')
url="https://sortix.org/rw"
license=('custom:ISC')
depends=('glibc')
source=(https://sortix.org/rw/release/rw-portable-${pkgver}.tar.gz)
sha256sums=('50009730e36991dfe579716f91f4f616f5ba05ffb7bf69c03d41bf305ed93b6d')

build() {
	cd rw-portable-${pkgver}
	make
}

package() {
	cd rw-portable-${pkgver}
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
