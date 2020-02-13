# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theterminal
pkgver=3.0
pkgrel=0
pkgdesc="Simple Terminal Emulator"
arch=("x86_64")
url="https://github.com/vicr123/theterminal"
license=('GPL3')
depends=('xdg-utils' 'tttermwidget' 'qt5-base' 'qt5-x11extras' 'the-libs')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/theterminal/archive/v3.0.tar.gz')
sha256sums=('ae129556502549293ef090afa2954389353c70d6a5d7c6f8a838bbaacaa607e9')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
