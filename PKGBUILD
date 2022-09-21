# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-playerctl-module
pkgver=1.3.7
pkgrel=1
pkgdesc="gtklock module adding media player controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-playerctl-module"
license=('GPL3')
depends=(gtk3 playerctl libsoup gtklock)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3dd65ac098b366f7e45e2054e209d341fba5efe202ab3db079365f967962cd2f')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
