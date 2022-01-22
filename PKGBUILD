# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.3.0
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.3.0.tar.gz")
sha256sums=('4a757f079e14bcfcd2804fed0a4a6190535ae059b45e3d73e5b298bba306201b')
install=way-displays-1_3.install

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

