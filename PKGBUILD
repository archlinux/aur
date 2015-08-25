pkgname=libgtextutils
pkgver=0.7
pkgrel=1
arch=(x86_64)
pkgdesc='Gordon’s Text utils Library'
url="https://github.com/agordon/$pkgname"
source=("$url/archive/$pkgver.tar.gz")
makedepends=(libtool autoconf automake)
sha256sums=('9eed751dea812ab247486f040754815bd3d0239557d0f91c0152d1b5b10dbc3e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	./reconf
	./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
}