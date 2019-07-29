# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thebeat
pkgver=2.0.1
pkgrel=0
pkgdesc="Audio Player based on Phonon"
arch=("x86_64")
url="https://github.com/vicr123/thebeat"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'phonon-qt5'  'qt5-base' 'taglib' 'the-libs' 'qt5-svg')
makedepends=('git' 'discord-rpc-api' 'qt5-tools')
optdepends=('discord-rpc-api: for Discord Rich Presence integration')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/theBeat/archive/v2.0.1.tar.gz")
sha256sums=('7c85d6e089285ab3206fc9731110a155dd46e30067554edc71f3edb33872b181')

build() {
	cd "theBeat-$pkgver"
	qmake
	make
}

package() {
	cd "theBeat-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
