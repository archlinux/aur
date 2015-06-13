# Maintainer: SanskritFritz (gmail)

pkgname=erebus
pkgver=0.10
pkgrel=1
pkgdesc="2D real-time role-playing game."
arch=('i686' 'x86_64')
url="http://erebusrpg.sourceforge.net/"
license=("GPLv3")
depends=('phonon' 'qtwebkit')
makedepends=('qt4')
source=('http://launchpad.net/erebus/trunk/$pkgver/+download/erebussrc.zip')

build() {
	cd "$srcdir/erebussrc"
	qmake-qt4 erebus.pro
	make
}

package() {
	cd "$srcdir/erebussrc"
	make INSTALL_ROOT="$pkgdir" install
	mkdir --parents $pkgdir/usr/bin
	ln -s /opt/erebus/erebus $pkgdir/usr/bin/erebus
}

md5sums=('a96fcd43d5741ba11c6b7b9bea38c0f3')
