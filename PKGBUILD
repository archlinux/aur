# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libtdesktopenvironment
pkgver=beta3
pkgrel=1
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('the-libs' 'qt5-svg' 'qt5-x11extras' 'qt5-base' 'glib2' 'libx11' 'libxss' 'libxext' 'libxrandr' 'networkmanager-qt' 'pulseaudio-qt')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libtdesktopenvironment/archive/beta3.tar.gz")
sha256sums=('9fa52ea87dab3c307f8675b9ed6db68c5a2c9af265861d7fb84e78efb6c0e25a')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver/lib"
	make install INSTALL_ROOT=$pkgdir
}
