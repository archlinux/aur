# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libtdesktopenvironment
pkgver=beta1
pkgrel=1
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('the-libs' 'qt5-svg' 'qt5-x11extras' 'qt5-base' 'glib2' 'libx11' 'libxss' 'libxext' 'libxrandr' 'networkmanager-qt' 'pulseaudio-qt')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libtdesktopenvironment/archive/beta1.tar.gz")
sha256sums=('5ee39d80e9fc1611606f7d6a23c55c0ab2357e9f2bcbc717a7e5fed7a4c9dbc4')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver/lib"
	make install INSTALL_ROOT=$pkgdir
}
