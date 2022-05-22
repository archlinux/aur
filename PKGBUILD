# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=20220522
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-layer-shell wayland pam)
source=("https://github.com/jovanlanik/gtklock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1e5a6a55e97878e97d84cacf011942802a97a544c9842ae8f60e5f5c45664d8c')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
