#Maintainer: Andrew Bibb <ajbibb@myfairpoint.net>
pkgname=cmst
pkgver=2015.03.01
pkgrel=2
pkgdesc="A QT based GUI front end for the connman connection manager with systemtray icon"
arch=('i686' 'x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('MIT')
depends=('qt5-base' 'connman' 'libxkbcommon-x11' 'hicolor-icon-theme')
source=(https://github.com/andrew-bibb/cmst/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('44a410debeb6038a57d7c5b816b27ee8')

build() {
	cd "$srcdir/$pkgname"
	qmake-qt5 DISTRO=arch
	make 
}


package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir/" install
}
