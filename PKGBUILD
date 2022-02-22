# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.4.0
pkgrel=1
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.4.0.tar.gz")
sha256sums=('0514e79fe113ebee02b3ca338336d10cf94d9ebf2e7bdb798dc48a3ca157ae28')
install=way-displays-1_4.install

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

