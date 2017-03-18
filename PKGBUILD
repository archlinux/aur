#Maintainer: Andrew Bibb <ajbibb@myfairpoint.net>
pkgname=cmst
pkgver=2017.03.18
pkgrel=1
pkgdesc="A QT based GUI front end for the connman connection manager with systemtray icon"
arch=('i686' 'x86_64')
url="https://github.com/andrew-bibb/cmst"
license=('MIT (Expat)')
depends=('qt5-base' 'connman' 'libxkbcommon-x11' 'hicolor-icon-theme')
source=(https://github.com/andrew-bibb/cmst/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ac0c80e2488c73fc58fe546a802b129b')

build() {
	cd "$srcdir/$pkgname"
	qmake-qt5 DISTRO=arch
	make 
}


package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir/" install
}
