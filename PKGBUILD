# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.5.0
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1ccc9643dd7ebdf2e0280f43d049aff4a47991b46992f14b425849ee8603bdc7')
install=way-displays-1_5.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

