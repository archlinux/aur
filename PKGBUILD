# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thebeat
pkgver=3.0
pkgrel=0
pkgdesc="Audio Player based on Phonon"
arch=("x86_64")
url="https://github.com/vicr123/thebeat"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'phonon-qt5' 'qt5-base' 'qt5-multimedia' 'taglib' 'the-libs' 'qt5-svg')
makedepends=('git' 'qt5-tools' 'libcdio-paranoia')
optdepends=('discord-rpc-api: for Discord Rich Presence integration')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/theBeat/archive/v3.0.tar.gz")
sha256sums=('9050e4d6fa9eabe620104f8900bfbfd51194b2dc82551aa75f7dde2c3d088853')

build() {
	cd "theBeat-$pkgver"
	mkdir -p build
	cd build
	qmake ../theBeat.pro
	make
}

package() {
	cd "theBeat-$pkgver"
	cd build
	make install INSTALL_ROOT=$pkgdir
}
