# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-powerbar-module
pkgver=2.0.1
pkgrel=1
pkgdesc="gtklock module adding power controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-powerbar-module"
license=('GPL3')
depends=(gtk3 gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('61e80400c95235e0a9fe2e3f1db8ec63de4678c265e5e27b22661d789f2ff2ca')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
