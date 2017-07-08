
# Maintainer: David Mazieres
pkgname=muchsync
pkgver=4
pkgrel=1
pkgdesc="synchronize notmuch mail across machines"
arch=(i686 x86_64)
url="http://www.muchsync.org/"
license=('GPL')
depends=(notmuch sqlite3 openssl openssh)
source=("http://www.$pkgname.org/src/$pkgname-$pkgver.tar.gz")
md5sums=('d18f3d4668fae572ce39ad8b76ee3b8a')

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
