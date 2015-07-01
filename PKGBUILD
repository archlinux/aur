# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: Kosava <kosava@archlinux.us>

pkgname=znotes
pkgver=0.4.5
pkgrel=5
pkgdesc="Lightweight crossplatform application for notes managment with simple interface"
arch=('i686' 'x86_64')
url="http://znotes.sourceforge.net"
license=('GPL')
depends=('qt4')
source=(https://github.com/proton/zNotes/archive/master.zip)
md5sums=('SKIP')

build() {
   cd $srcdir/zNotes-master
   echo "QMAKE_CXXFLAGS_RELEASE = $CFLAGS" >> znotes.pro
   echo "QMAKE_CFLAGS_RELEASE = $CXXFLAGS" >> znotes.pro
   qmake-qt4 PREFIX=/usr
   make
}

package() {
   cd $srcdir/zNotes-master
   make INSTALL_ROOT=$pkgdir install
}
