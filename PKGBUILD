# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=wideriver
pkgver=1.2.1
pkgrel=2
pkgdesc="tiling window manager for the river wayland compositor"
arch=('x86_64')
url="https://github.com/alex-courtis/wideriver"
license=('MIT')
depends=('wayland' 'wlroots0.18' 'libinput')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cc8efaff440ee34e41ec63665aa02b2000fa160f31f2fa041a948bd446dfb620')
install=wideriver.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ wideriver
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

