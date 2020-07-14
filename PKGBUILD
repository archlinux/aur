# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libtdesktopenvironment
pkgver=beta2
pkgrel=1
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('the-libs' 'qt5-svg' 'qt5-x11extras' 'qt5-base' 'glib2' 'libx11' 'libxss' 'libxext' 'libxrandr' 'networkmanager-qt' 'pulseaudio-qt')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libtdesktopenvironment/archive/beta2.tar.gz")
sha256sums=('b502b82272bb4e2fd70ec7c4a0e50ef2b23340a189ac950b539c1e37a2fee7e8')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver/lib"
	make install INSTALL_ROOT=$pkgdir
}
