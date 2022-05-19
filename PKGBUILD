# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=20220520
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-layer-shell wayland pam)
source=("https://github.com/jovanlanik/gtklock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cea96d3c8f4762d405522d29f9aac112d36d1256f721744b47119b9204351176')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
