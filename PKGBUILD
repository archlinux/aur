# Maintainer: bitwave <aur [at] oomlu [d0t] de>
pkgname=ddumbfs
pkgver=1.1
pkgrel=1
pkgdesc="a fast inline deduplication filesystem for Linux. Based on FUSE"
arch=(i686 x86_64)
url="http://www.magiksys.net/ddumbfs"
license=('GPL')
groups=("system")
depends=("mhash" "fuse")
provides=(ddumbfs)
conflicts=(ddumbfs)
source=("http://www.magiksys.net/download/ddumbfs/${pkgname}-${pkgver}.tar.gz")
md5sums=('68c1bf03dbf75be0965d84217966cff9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
