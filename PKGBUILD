
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the-libs
pkgver=3.0
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/the-libs"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'gsettings-qt')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/the-libs/archive/v3.0.tar.gz")
sha256sums=('d58dc201f97b762029043d6074fb3d947f511f7049dc295283315e966dec4443')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
