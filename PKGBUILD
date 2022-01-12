# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.2.1
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.2.1.tar.gz")
sha256sums=('a6416e2207a5e5ddf747cc4cfef6c4b37ebe37aa6684ef6e47ef1d274e747949')
install=way-displays-1_2.install

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

