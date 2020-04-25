
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the-libs
pkgver=2.1
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/the-libs"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'gsettings-qt')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/the-libs/archive/v2.1.tar.gz")
sha256sums=('8c20cbd53ab6f3485a507825daf74b4d7dcc23c50f41990e793e72df101e57cd')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
