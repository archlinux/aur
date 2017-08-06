# Maintainer: beest <gnubeest@zoho.com>

pkgname=motsognir
pkgver=1.0.9
pkgrel=1
pkgdesc="a robust, reliable and easy to install gopher server"
arch=(x86_64)
url="http://motsognir.sourceforge.net/"
license=('GPL3')
optdepends=('php: php scripting support')
source=("https://downloads.sourceforge.net/project/$pkgname/v$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('21a3d6638d105d70c4579cf23d0118b6')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's|/sbin/|/bin/|g' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
