# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=wideriver
pkgver=1.3.0
pkgrel=1
pkgdesc="tiling window manager for the river wayland compositor"
arch=('x86_64')
url="https://github.com/alex-courtis/wideriver"
license=('MIT')
depends=('wayland' 'wlroots0.18' 'libinput')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('77ef35b978483f245ac8d6fd14942b99c5d6e6e5437eedba43a96c994febc61b')
install=wideriver.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ wideriver
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

