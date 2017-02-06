# Maintainer: Michał Lisowski <lisu87@gmail.com>
pkgname=whatmask
pkgver=1.2
pkgrel=1
pkgdesc="Small C program that will help you with network settings"
arch=('i686' 'x86_64')
url="http://www.laffeycomputer.com/whatmask.html"
license=('GPL')
depends=()
makedepends=()
source=("http://downloads.laffeycomputer.com/current_builds/whatmask/$pkgname-$pkgver.tar.gz")
md5sums=('26aeff74dbba70262ccd426e681dcf4a')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
  aclocal
  autoconf
  automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
