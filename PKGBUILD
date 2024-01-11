# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=nudoku
pkgver=3.0.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=(
		"$pkgname-$pkgver.tar.gz::https://github.com/jubalh/nudoku/archive/$pkgver.tar.gz"
	   )
b2sums=('ff75b02e87b231c2ae3f1109e5f6c39efd37b5f9bc6cf11247dfc1098399e8dc647b144a186b3b9f62ffcb1e7c9dd37ba1a1ce4fa917829e8498e2eed48f80ea')

build() {
	cd "$pkgname-$pkgver"
		autoreconf -i
		./configure --prefix=/usr --enable-cairo
		make
}

package() {
	cd "$pkgname-$pkgver"
		make DESTDIR="$pkgdir/" install
}
