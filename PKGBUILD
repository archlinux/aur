# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thebeat
pkgver=2.0
pkgrel=0
pkgdesc="Audio Player based on Phonon"
arch=("x86_64")
url="https://github.com/vicr123/thebeat"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'phonon-qt5'  'qt5-base' 'taglib' 'the-libs' 'qt5-svg')
makedepends=('git' 'discord-rpc-api' 'qt5-tools')
optdepends=('discord-rpc-api: for Discord Rich Presence integration')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thebeat.git')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
