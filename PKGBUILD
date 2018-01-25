# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=libmd
pkgver=1.0.0
pkgrel=1
pkgdesc="message digest functions for BSD systems"
arch=(i686 x86_64)
url="https://www.hadrons.org/software/libmd/"
license=('BSD')
source=("https://archive.hadrons.org/software/$pkgname/$pkgname-$pkgver.tar.xz"
        "https://archive.hadrons.org/software/$pkgname/$pkgname-$pkgver.tar.xz.asc")
sha256sums=('f21aea69f6411cb4307cda1f6378c7ed07830202b5f4cb9e64f681fdaf2d64c7'
            'SKIP')
validpgpkeys=('4F3E74F436050C10F5696574B972BF3EA4AE57A3') # Guillem Jover

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
