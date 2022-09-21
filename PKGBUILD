# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=1.3.8
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-layer-shell)
makedepends=(scdoc)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9911609e70d0ce4f310b212d256964fbcdb57d5075f97538f86511c88ae9ea1')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
