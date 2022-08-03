# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-example-module
pkgver=1.3.4
pkgrel=1
pkgdesc="Example module for gtklock"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-example-module"
license=('MIT')
depends=(gtk3 gtklock=$pkgver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b17a0e336ac99b5618ac989c15c13d42d1d0969fd75a976156aca77515532ad')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir"/usr/share/licenses/"$pkgname"
	install -m644 LICENCE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENCE
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
