# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-playerctl-module
pkgver=2.0.0
pkgrel=1
pkgdesc="gtklock module adding media player controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-playerctl-module"
license=('GPL3')
depends=(gtk3 playerctl libsoup gtklock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1e62534f0bb6346920f3a96fd4ad47df8137e52b86b85860800857bf7af847b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
