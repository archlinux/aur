
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thedm
pkgver=0.1
pkgrel=0
pkgdesc="Display Manager"
arch=("x86_64")
url="https://github.com/vicr123/thedm"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'the-libs' 'xorg-xrandr' 'kscreen')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thedm#branch=master')
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
