# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=xlayoutdisplay
pkgver=1.1.0
pkgrel=0
pkgdesc="Detects and arranges linux display outputs, using XRandR for detection and xrandr for arrangement."
arch=('x86_64')
url="https://github.com/alex-courtis/xlayoutdisplay"
license=('Apache')
depends=('xorg-xrandr' 'xorg-xrdb' 'libxcursor')
makedepends=('git' 'cmake' 'boost')
source=("https://github.com/alex-courtis/xlayoutdisplay/archive/v$pkgver.tar.gz")
sha256sums=('803a67af320ddc4dacfd57f9dee21864a2670481a1cd4c76a4c9bfa42fd7cefb')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make xlayoutdisplay
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
