pkgname=sblim-sfcc
pkgver=2.2.8
pkgrel=1
pkgdesc="Small Footprint CIM Client Library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/sblim/"
license=('EPL')
depends=('curl')
source=("https://downloads.sourceforge.net/project/sblim/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('0bac0dec19f17ec065b6c332a56d7bae')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}