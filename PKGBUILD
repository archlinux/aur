# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libtdesktopenvironment
pkgver=beta4
pkgrel=2
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('the-libs' 'qt5-svg' 'qt5-x11extras' 'qt5-base' 'glib2' 'libx11' 'libxss' 'libxext' 'libxrandr' 'networkmanager-qt' 'pulseaudio-qt')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libtdesktopenvironment/archive/beta4.tar.gz")
sha256sums=('8e251a514aadd58c44f9f04c65cd2a25d671b342b3e190f5252fd08cdc02795b')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver/lib"
	make install INSTALL_ROOT=$pkgdir
}
