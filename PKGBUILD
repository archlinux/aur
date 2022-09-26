# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=1.4.0
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-layer-shell)
makedepends=(scdoc)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4aebf519c187eaf9dbfa1e4ecef69a806324ed287553a7a17ee8bbe7d555de29')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
