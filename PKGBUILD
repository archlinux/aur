# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.1.0
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.1.0.tar.gz")
sha256sums=('29f712c52efd971264f3b49f896f3c73e9c5726430c8a03c234825ed9fb84641')
install=way-displays-1_1_0.install

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

