# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=libmd
pkgver=0.0.0
pkgrel=1
pkgdesc="message digest functions for BSD systems"
arch=(i686 x86_64)
url="https://www.hadrons.org/software/libmd/"
license=('BSD')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('fd3f2366236fb3fd0dac0c0a77ffff8511e2939c79d1d58daf56e3f5ee383a88')

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
