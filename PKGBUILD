# Maintainer: Marco von Rosenberg <codingmarco@gmail.com>

pkgname=mlrpt
pkgver=1.4
pkgrel=1
pkgdesc="Non-interactivr command-line version of glrpt for receiving, decoding and saving LRPT images from the Russian Meteor-M type of weather satellites"
arch=('x86_64')
url="http://www.5b4az.org"
license=('GPLv3')
depends=('rtl-sdr')
makedepends=('make')
source=("http://www.5b4az.org/pkg/lrpt/$pkgname-$pkgver.tar.bz2")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
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
