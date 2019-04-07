# Maintainer: Andrew Katz <akatz712@gmail.com>
# Contributor:  Andrew Katz <akatz712@gmail.com>
pkgname=mdesigner
pkgver=1.0
pkgrel=5
pkgdesc="Extended emulation of metalic gear based toy, creates curved line designs."
arch=('x86_64')
url="http://www.akatz712.com/"
license=('GPL')
depends=('fltk>=1.3.3' 'libharu')
makedepends=('fltk>=1.3.3' 'libharu')
source=("https://sourceforge.net/projects/complexshapes/files/$pkgname-$pkgver.tar.gz/download")
md5sums=('f4696ea143923c7a265af91640f4fe7e')

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
