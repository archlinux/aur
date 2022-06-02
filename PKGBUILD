# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-layer-shell)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4dfbff5f484153e62aa0cd63f538a5baf9e32c890f8c6f62dd85274670289bc5')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
