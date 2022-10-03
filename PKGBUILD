# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-playerctl-module
pkgver=1.4.1
pkgrel=1
pkgdesc="gtklock module adding media player controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-playerctl-module"
license=('GPL3')
depends=(gtk3 playerctl libsoup gtklock)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3ebfc398964e849fa0c69d8a539795cbfe90658aeeff9de54dee5839d8a04df')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
