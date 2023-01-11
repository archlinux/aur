
# Maintainer: David Mazieres
pkgname=muchsync
pkgver=7
pkgrel=1
pkgdesc="synchronize notmuch mail across machines"
arch=(i686 x86_64)
url="http://www.muchsync.org/"
license=('GPL')
depends=(notmuch sqlite3 openssl openssh)
source=("http://www.$pkgname.org/src/$pkgname-$pkgver.tar.gz")
md5sums=('44354dd6c33ac85c68760d9d7298fa64')


prepare() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
