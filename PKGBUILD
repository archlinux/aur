# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-powerbar-module
pkgver=3.0.0
pkgrel=1
pkgdesc="gtklock module adding power controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-powerbar-module"
license=('GPL3')
depends=(gtk3 gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56234ad947597e590c0275cc6d5182c958d2193e5a18d8e57d632871c2ff5238')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
