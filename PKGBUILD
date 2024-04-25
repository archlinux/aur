# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=wideriver
pkgver=1.1.0
pkgrel=1
pkgdesc="tiling window manager for the river wayland compositor"
arch=('x86_64')
url="https://github.com/alex-courtis/wideriver"
license=('MIT')
depends=('wayland' 'wlroots' 'libinput')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cda5ff3df7fc206ff96fb54200cffd248ffdc4766b198b97e39cb04f32810a9e')
install=wideriver.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ wideriver
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

