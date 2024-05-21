# Maintainer: Emily Ellis <emily@scgtrp.net>
pkgname=gcmc
pkgver=1.9.2
pkgrel=1
pkgdesc="G-code meta-compiler"
depends=('glibc' 'readline')
arch=(x86_64)
url="http://www.vagrearg.org/content/gcmc"
license=('GPL-3.0-or-later')
source=("http://www.vagrearg.org/gcmc/gcmc-$pkgver.tar.gz")
sha512sums=('4ed2df7a565de5b825b7374f3ac82059148eb65ea29485ec3a02661d3204f9c5ea791354c79d6d3c69fccf3d471d71ce9d257d66333319c06cf040af4e05888f')

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
