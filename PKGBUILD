# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thebeat
pkgver=3.1
pkgrel=0
pkgdesc="Audio Player based on Phonon"
arch=("x86_64")
url="https://github.com/vicr123/thebeat"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'phonon-qt5' 'qt5-base' 'qt5-multimedia' 'taglib' 'the-libs' 'qt5-svg')
makedepends=('git' 'qt5-tools' 'libcdio-paranoia')
optdepends=('discord-rpc-api: for Discord Rich Presence integration')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/theBeat/archive/v3.1.tar.gz")
sha256sums=('2e64eba43312522a5b54b8ddf5b172569aee367797709fd7e08346cc1d5e06f4')

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
