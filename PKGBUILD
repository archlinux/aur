# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=2.0.1
pkgrel=2
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-layer-shell)
makedepends=(scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1802a7fcb8cace0408ab34627841d7ea28d630f934c8b7884536f9dfa76910e')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
