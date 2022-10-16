# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=1.4.1
pkgrel=2
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-layer-shell)
makedepends=(scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76973caec1cc0e9d2d2e88d32ae1fab67bac93a10995755c6e66e5009ba8df85')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
