 # Maintainer: Hubert Toullec <hutou01@gmail.com>
pkgname=libuninum
pkgver=2.7
pkgrel=1
pkgdesc="Converts Unicode strings to numbers and numbers to Unicode strings"
arch=(x86_64)
license=('GPL')
depends=('gmp')
source=("http://billposer.org/Software/Downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('e704983c3c00e9b76bd836b8b83ce31bfe4eb1752eee8be123cf97c1275076ea')
url="https://billposer.org/Software/libuninum.html"

build() {
	cd "$pkgname-$pkgver"
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
