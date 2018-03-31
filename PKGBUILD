# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=xlayoutdisplay
pkgver=1.0.2
pkgrel=0
pkgdesc="Detects and arranges linux display outputs, using XRandR for detection and xrandr for arrangement."
arch=('x86_64')
url="https://github.com/alex-courtis/xlayoutdisplay"
license=('Apache')
depends=('xorg-xrandr' 'xorg-xrdb' 'libxcursor' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
source=("https://github.com/alex-courtis/xlayoutdisplay/archive/v$pkgver.tar.gz")
sha256sums=('5d753f1b0f626daf9e8af4c4200a81ddadb6930a98270ccf3e284988102814f6')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make xlayoutdisplay
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
