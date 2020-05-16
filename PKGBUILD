# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=xlayoutdisplay
pkgver=1.1.2
pkgrel=0
pkgdesc="Detects and arranges linux display outputs, using XRandR for detection and xrandr for arrangement."
arch=('x86_64')
url="https://github.com/alex-courtis/xlayoutdisplay"
license=('Apache')
depends=('xorg-xrandr' 'xorg-xrdb' 'libxcursor')
makedepends=('git' 'cmake' 'boost')
source=("https://github.com/alex-courtis/xlayoutdisplay/archive/v$pkgver.tar.gz")
sha256sums=('93175a25224c0e9f6c3be5014d05183114b46f6bf3115efdc86ea8756848dc25')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make xlayoutdisplay
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
