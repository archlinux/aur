
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the-libs-blueprint
pkgver=2.1b
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
conflicts=('the-libs')
provides=('the-libs')
arch=("x86_64")
url="https://github.com/vicr123/the-libs"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'gsettings-qt')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"git+https://github.com/vicr123/the-libs")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	git checkout blueprint
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
