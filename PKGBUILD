# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=way-displays
pkgver=1.10.0
pkgrel=2
pkgdesc="way-displays: Auto Manage Your Wayland Displays"
arch=('x86_64')
url="https://github.com/alex-courtis/way-displays"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput' 'yaml-cpp')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('78fc8949d1a4ccf7982bd2844de52b4d2dd3821c1db86d1ace088d0822498e1a')
install=way-displays.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ way-displays
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

