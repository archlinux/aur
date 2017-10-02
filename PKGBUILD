# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
pkgname=psi
pkgver=1.3
pkgrel=1
pkgdesc="Free instant messaging application designed for the XMPP network"
arch=('x86_64')
url="http://psi-im.org/"
license=('GPL2')
depends=('qca-qt5' 'qt5-x11extras' 'qt5-multimedia' 'aspell' 'libxss' 'minizip' 'desktop-file-utils' 'hicolor-icon-theme')
conflicts=('psi-git')
replaces=('psi-git')
source=("https://downloads.sourceforge.net/project/${pkgname}/Psi/${pkgver}/psi-${pkgver}.tar.xz")
sha256sums=("59debd16e61ab1d4ff88aca9f41b9caaaca8395f1576418fb99214d5e2c6fa8b")

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
