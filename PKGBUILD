# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.0.1
pkgrel=1
pkgdesc="way-displays: Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/way-displays/archive/refs/tags/1.0.1.tar.gz")
sha256sums=('51c357664fdc9641f73999368b7d1cfe86e620f6f7f32e1eccf5fd48dcfbae72')

build() {
	cd "$pkgname-$pkgver"
	make way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

