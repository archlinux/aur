# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=wideriver
pkgver=1.2.0
pkgrel=1
pkgdesc="tiling window manager for the river wayland compositor"
arch=('x86_64')
url="https://github.com/alex-courtis/wideriver"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c956d0572bcad1e8b76751734616fd60f04f53f450e5e8a835c45810347a43a')
install=wideriver.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ wideriver
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

