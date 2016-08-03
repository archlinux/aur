# Maintainer: svalo <me@valo.space> 
pkgname=plzip
pkgver=1.5
pkgrel=1
pkgdesc="A massively parallel lossless data compressor based on the lzlib compression library"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lzip/plzip.html"
license=('GPL')
depends=('lzlib')
source=("http://download.savannah.gnu.org/releases/lzip/plzip/$pkgname-$pkgver.tar.gz")
md5sums=('504d46ba468d337ec6c42f3c583632ba')
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
