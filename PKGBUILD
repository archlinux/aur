# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.0.0
pkgrel=1
pkgdesc="way-displays: Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.0.0.tar.gz")
sha256sums=('5d51b74f7c9ea21c7503222d84a9f74f3832890bc7d0b86201033f56395e7a42')

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir/" install
}

