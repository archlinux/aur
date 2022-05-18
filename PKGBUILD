# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=20220519
pkgrel=2
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-layer-shell wayland pam)
source=("https://github.com/jovanlanik/gtklock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8a27d86a15bc7eb49d4d7ff91625c1a92befad35af7b15c0114b71ab75831a17')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
