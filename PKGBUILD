
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the-libs
pkgver=5.0
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/the-libs"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'gsettings-qt')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/the-libs/archive/v5.0.tar.gz")
sha256sums=('e97aa772a0b329bc7fc2c2e649cd0718342b33b86e12fcd2ceb99872b7ce2de6')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
