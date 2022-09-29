# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-playerctl-module
pkgver=1.4.0
pkgrel=1
pkgdesc="gtklock module adding media player controls to the lockscreen"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-playerctl-module"
license=('GPL3')
depends=(gtk3 playerctl libsoup gtklock)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41a812fe65df05446f9dfd5897de6a74f26aaa9733909c5368f0a7ebf773e44a')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
