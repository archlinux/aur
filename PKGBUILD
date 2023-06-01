# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=2.1.0
pkgrel=2
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-layer-shell)
makedepends=(scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47cc09ab773e90e3a28240faaabb8d9ac4e36f5234a2b5c3a956039783365f43')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
