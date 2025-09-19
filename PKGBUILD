# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=wideriver
pkgver=1.3.1
pkgrel=1
pkgdesc="tiling window manager for the river wayland compositor"
arch=('x86_64')
url="https://github.com/alex-courtis/wideriver"
license=('MIT')
depends=('wayland' 'wlroots0.18' 'libinput')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6ccd45cab794311ab9ad08c9c53b09eac5eb7bd24efc34f19b58586aa598df9d')
install=wideriver.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ wideriver
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

