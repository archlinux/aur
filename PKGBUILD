# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=1.3.7
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-layer-shell)
makedepends=(scdoc)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('38dd6a37311aa080eb9508a8f485c290edbd5b8baeb2e43cdbdc268004a85833')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
