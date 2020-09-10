# Maintainer: Rose Kunkel <rose at rosekunkel dot me>

pkgname=guile-config
pkgver=0.4.2
pkgrel=1
pkgdesc='Configuration management library for GNU Guile'
arch=('x86_64')
url='https://gitlab.com/a-sassmannshausen/guile-config'
license=('GPL3')
depends=('guile')
source=("https://gitlab.com/a-sassmannshausen/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1daf04b52cfc587e73deb5722b46c12afece015caf3712c44ab7d9630a8f3b4a')

build() {
	cd "$pkgname-$pkgver"
    autoreconf -vif
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
