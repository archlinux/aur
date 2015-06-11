
# Maintainer: David Mazieres
pkgname=muchsync
pkgver=1
pkgrel=1
pkgdesc="synchronize notmuch mail across machines"
arch=(i686 x86_64)
url="http://www.muchsync.org/"
license=('GPL')
depends=(notmuch sqlite3 openssl openssh)
source=("http://www.$pkgname.org/src/$pkgname-$pkgver.tar.gz")
md5sums=('6ce5a25f9585bea56f1f62e2801163a1')

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
