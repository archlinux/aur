# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=xlayoutdisplay
pkgver=1.2.0
pkgrel=0
pkgdesc="Detects and arranges linux display outputs, using XRandR for detection and xrandr for arrangement."
arch=('x86_64')
url="https://github.com/alex-courtis/xlayoutdisplay"
license=('Apache')
depends=('xorg-xrandr' 'xorg-xrdb' 'libxcursor')
makedepends=('git' 'cmake' 'boost')
source=("https://github.com/alex-courtis/xlayoutdisplay/archive/v$pkgver.tar.gz")
sha256sums=('10258c09ba256807ae2dcd0c96c83e4943cf815bb6be2e678e821380d6822cfc')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make xlayoutdisplay
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
