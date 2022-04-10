# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.5.2
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7e4ce33cd55ae0a9822fabf45893db51e8131bc2fe84fed0be57621434c3b477')
install=way-displays-1_5.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

