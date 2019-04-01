# Maintainer: Andrew Katz <akatz712@gmail.com>
# Contributor:  Andrew Katz <akatz712@gmail.com>
pkgname=mdesigner
pkgver=1.0
pkgrel=1
pkgdesc="Extended emulation of metalic gear based toy, creates curved line designs."
arch=('x86_64')
url="http://www.akatz712.com/"
license=('GPL')
depends=('fltk' 'libharu')
makedepends=('fltk' 'libharu')
source=("https://sourceforge.net/projects/complexshapes/files/$pkgname-$pkgver.tar.gz/download")
md5sums=('9fb8340006da51ce6694de4e49b1f506')

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
