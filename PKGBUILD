#Maintainer: Andrew Bibb <ajbibb@myfairpoint.net>
pkgname=cmst
pkgver=2015.10.03
pkgrel=2
pkgdesc="A QT based GUI front end for the connman connection manager with systemtray icon"
arch=('i686' 'x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('MIT')
depends=('qt5-base' 'connman' 'libxkbcommon-x11' 'hicolor-icon-theme')
source=(https://github.com/andrew-bibb/cmst/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('7dca5c2fd59db2f025a3fa11c4fa1a7a')

build() {
	cd "$srcdir/$pkgname"
	qmake-qt5 DISTRO=arch
	make 
}


package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir/" install
}
