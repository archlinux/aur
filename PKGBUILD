
# Maintainer: David Mazieres
pkgname=muchsync
pkgver=5
pkgrel=1
pkgdesc="synchronize notmuch mail across machines"
arch=(i686 x86_64)
url="http://www.muchsync.org/"
license=('GPL')
depends=(notmuch sqlite3 openssl openssh)
source=("http://www.$pkgname.org/src/$pkgname-$pkgver.tar.gz")
md5sums=('87ef218c956214e2829c6d91014e2965')


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
