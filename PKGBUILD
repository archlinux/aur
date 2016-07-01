# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: jfperini <@jfperini>
pkgname=dukto
pkgver=R6
pkgrel=1
pkgdesc="A simple, fast and multi-platform file transfer tool for LAN users."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/dukto"
license=('GPL2')
depends=('qt4')
makedepends=('subversion')
source=(dukto::'svn+http://svn.code.sf.net/p/dukto/code/trunk#revision=109')
sha256sums=('SKIP')

build() {
	cd dukto
	qmake-qt4
	make
}

package() {
	cd dukto
	install -Dm755 dukto "$pkgdir/usr/bin/dukto"
	make INSTALL_ROOT="$pkgdir" install_desktop install_icon
}
