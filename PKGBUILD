# Maintainer: Mike Smith <mike@scgtrp.net>
pkgname=gcmc
pkgver=1.8.3
pkgrel=1
pkgdesc="G-code meta-compiler"
depends=('glibc')
arch=(x86_64)
url="http://www.vagrearg.org/content/gcmc"
license=('GPL3')
source=("http://www.vagrearg.org/gcmc/gcmc-$pkgver.tar.gz")
sha512sums=('e9ba4a0b8a43a27cddc5e569e7668a1e3b2650e97910169476527487ec1cc870a4e8baa80046e206b6435806721639854c9bb3070d1feac522f2c4510c3c4631')

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
