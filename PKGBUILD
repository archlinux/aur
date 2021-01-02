# Maintainer: SanskritFritz (gmail)

pkgname=bubble-chains
#_pkgname=chains
pkgver=0.2.0
pkgrel=1
pkgdesc="A 2d arcade-puzzle game. The aim is to collect chains of same-color bubbles, and to destroy all the target items."
arch=('x86_64')
url="https://github.com/ArsMasiuk/bubble-chains"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'libxrandr')
source=("https://github.com/ArsMasiuk/bubble-chains/archive/V$pkgver.tar.gz")

md5sums=('97d698ff53044cadacffdddce9f522b0')

prepare() {
	cd $pkgname-$pkgver
	sed -i -e 's#/usr/local/bin#/usr/bin#g' chains.pro
}

build() {
	cd $pkgname-$pkgver
	qmake-qt5
	make
}
package() {
	cd $pkgname-$pkgver
	make INSTALL_ROOT=${pkgdir} install
}
