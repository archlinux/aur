# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-powerbar-module
pkgver=1.3.7
pkgrel=4
pkgdesc="gtklock module adding power controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-powerbar-module"
license=('GPL3')
depends=(gtk3 gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('837277a699a0a3ec3517b1b0d8d1c6e5d6ded1ad7b9f016233ae55e099ebc5fb')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
