# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: Kosava <kosava@archlinux.us>

pkgname=znotes
pkgver=0.4.5
pkgrel=7
pkgdesc="Lightweight crossplatform application for notes managment with simple interface"
arch=('i686' 'x86_64')
url="http://znotes.sourceforge.net"
license=('GPL')
depends=('qt5-tools')
source=(https://github.com/proton/zNotes/archive/master.zip)
md5sums=('SKIP')


build() {
   cd $srcdir/zNotes-master
   lrelease-qt5 znotes.pro
   qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" PREFIX=/usr
   make
}

package() {
   cd $srcdir/zNotes-master
   make INSTALL_ROOT=$pkgdir install
}
md5sums=('9604bc0f00aa169c6caac8f2ccad98ab')
