# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=20220531
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-layer-shell wayland pam)
source=("https://github.com/jovanlanik/gtklock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('84ab380a7cbb4189e4ff4524bdbd093976bf0a4155d5148a3707dee530d41dfb')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
