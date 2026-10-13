# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=wideriver
pkgver=1.4.0
pkgrel=1
pkgdesc="tiling window manager for the river-classic wayland compositor"
arch=('x86_64')
url="https://github.com/alex-courtis/wideriver"
license=('MIT')
depends=('wayland' 'river-classic' 'libinput')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/alex-courtis/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bd54ce0a920925df953e83495053a8f4b43e7a3f8d8a1f079d270c6fd8d02046')
install=wideriver.install

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc CXX=g++ wideriver
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" PREFIX_ETC="" DESTDIR="$pkgdir" install
}

