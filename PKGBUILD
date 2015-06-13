# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=libqxt
pkgver=0.6.2
pkgrel=4
pkgdesc="provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit"
arch=('i686' 'x86_64')
url="http://www.libqxt.org"
license=('CPL')
depends=('qt4' 'openssl' 'db')
optdepends=('avahi')
source=(http://bitbucket.org/libqxt/libqxt/get/v$pkgver.tar.bz2)
md5sums=('a859a1757dc0aaf010df1a0783e3e001')

build() {
	cd $srcdir/$pkgname-*
	./configure -prefix /usr -qmake-bin "/usr/bin/qmake-qt4"
	make
}

package() {
	cd $srcdir/$pkgname-*
	make INSTALL_ROOT=$pkgdir install
}
