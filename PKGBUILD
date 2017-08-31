# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
pkgname=psi
pkgver=1.2
pkgrel=1
pkgdesc="Free instant messaging application designed for the XMPP network"
arch=('x86_64')
url="http://psi-im.org/"
license=('GPL2')
depends=('qca-qt5' 'qt5-x11extras' 'qt5-multimedia' 'aspell' 'libxss' 'minizip' 'desktop-file-utils' 'hicolor-icon-theme')
conflicts=('psi-git')
replaces=('psi-git')
source=("https://downloads.sourceforge.net/project/${pkgname}/Psi/${pkgver}/psi-${pkgver}.tar.xz")
sha256sums=("16ce1b767d40453032cd5d9ad5a9d4c6dba43989acc9a09538da3f74b7c614f5")

build() {
	cd "$srcdir/$pkgname-$pkgver"

	 ./configure --prefix=/usr \
             --libdir=/usr/lib \
             --disable-enchant \
             --qtselect=5

	make	     
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make INSTALL_ROOT="$pkgdir" install
}
