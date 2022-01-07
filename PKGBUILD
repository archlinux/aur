# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.2.0
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.2.0.tar.gz")
sha256sums=('f1d651c1e26de288594dd19e81f09318fec0aedc5b9d04e31cec6251b8692804')
install=way-displays-1_2_0.install

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

