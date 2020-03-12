# Maintainer: Stefan Haller <fgrsnau@gmail.com>
pkgname=recutils
pkgver=1.8
pkgrel=2
pkgdesc="Set of tools and libraries to access plain text databases called recfiles."
arch=(i686 x86_64)
url="https://www.gnu.org/software/recutils/"
license=('GPL')
depends=('libgcrypt')
checkdepends=('check')
source=("https://ftp.gnu.org/gnu/recutils/$pkgname-$pkgver.tar.gz")
md5sums=('0ec4f9046cc01092758be9c4988c6fb3')

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
