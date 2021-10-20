# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.0.2
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.0.2.tar.gz")
sha256sums=('b5ce6cf1316746183f4856801e956df0d0b9012e089a96f7611667af62b602d8')

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

