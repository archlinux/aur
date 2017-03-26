# Maintainer: grzegorz225 <gorbak25@gmail.com>
pkgname=gtkmm3-plplot
pkgver=2.2
pkgrel=1
pkgdesc="A scientific plotting library for Gtkmm."
arch=('any')
url="https://tschoonj.github.io/gtkmm-plplot/index.html"
license=('(L)GPL3')
depends=('gtkmm3' 'plplot')
makedepends=('gcc')
optdepends=('boost')
conflicts=('gtkmm3-plplot-git')
source=('https://github.com/tschoonj/gtkmm-plplot/releases/download/gtkmm-plplot-2.2/gtkmm-plplot-2.2.tar.gz' 'LICENSE')
sha256sums=('SKIP' 'da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768')

build() {
	cd "gtkmm-plplot-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "gtkmm-plplot-$pkgver"
	make DESTDIR="$pkgdir/" install
}
