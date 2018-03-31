# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=xlayoutdisplay
pkgver=1.0.1
pkgrel=3
pkgdesc="Detects and arranges linux display outputs, using XRandR for detection and xrandr for arrangement."
arch=('x86_64')
url="https://github.com/alex-courtis/xlayoutdisplay"
license=('Apache')
depends=('xorg-xrandr' 'xorg-xrdb' 'libxcursor' 'boost')
makedepends=('git' 'cmake')
source=("https://github.com/alex-courtis/xlayoutdisplay/archive/v$pkgver.tar.gz")
sha256sums=('150d410d30281e753b4342fa8f26f34cbfdfa070241388403004ddb988c1cc42')

build() {
	cd "$pkgname-$pkgver"
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname-$pkgver"
        cd build
	make install
}
