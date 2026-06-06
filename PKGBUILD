# Maintainer: ZynskeyFolf <djpixus at gmail dot com>
pkgname=jmidiracc-git
pkgver=r1
pkgrel=1
pkgdesc="Customizable Jack MIDI control panel with CC and sysex macro support"
arch=('x86_64')
url="https://codeberg.org/zynskeyfolf/jmidiracc"
license=('GPL-3.0-only')
groups=('pro-audio')
provides=('jmidiracc')
depends=('qt6-base' 'jack')
makedepends=('git' 'cmake' 'make' 'qt6-base' 'jack')
source=("git+https://codeberg.org/zynskeyfolf/jmidiracc")
sha256sums=(SKIP)

build() {
	mkdir "jmidiracc/build"
	cd "jmidiracc/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make
}

package() {
	cd "jmidiracc/build"
	make install
}
