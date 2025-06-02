# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=wideriver-wlroots0.18
_pkgname=wideriver
pkgver=1.2.0
pkgrel=1
pkgdesc="tiling window manager for the river wayland compositor"
arch=('x86_64')
url="https://github.com/alex-courtis/wideriver"
license=('MIT')
depends=('wayland' 'wlroots0.18' 'libinput')
makedepends=('git' 'make' 'gcc')
conflicts=(wideriver)
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')
install=wideriver.install

build() {
	cd "$_pkgname-$pkgver"
	make CC=gcc CXX=g++ wideriver
}

package() {
	cd "$_pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

