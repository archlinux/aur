# Maintainer: ZynskeyFolf <djpixus at gmail dot com>
pkgname=alsa-eldview-git
pkgver=r1
pkgrel=1
pkgdesc="View audio capabilities of TV or sound system connected via HDMI or DisplayPort."
arch=('x86_64')
url="https://zynskey.nekoweb.org/eldviewer"
license=('GPL-3.0-or-later')
provides=('alsa-eldview')
depends=('qt6-base' 'alsa-lib')
makedepends=('git' 'cmake' 'make' 'qt6-base' 'alsa-lib')
source=("git+https://codeberg.org/zynskeyfolf/alsa-eldview")
sha256sums=(SKIP)

build() {
	mkdir "alsa-eldview/build"
	cd "alsa-eldview/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make
}

package() {
	cd "alsa-eldview/build"
	make install
}
