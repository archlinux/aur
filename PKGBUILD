# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=touchegg-svn
pkgver=191
pkgrel=1
pkgdesc="Multitouch gesture recognizer"
arch=(i686 x86_64)
url="https://code.google.com/p/touchegg/"
license=(GPL)
depends=(qt4 geis)
makedepends=(subversion)
provides=(touchegg)
conflicts=(touchegg)
source=('touchegg::svn+http://touchegg.googlecode.com/svn')
sha512sums=('SKIP')

pkgver() {
  cd touchegg
  svnversion | tr -d [A-z]
}

build() {
  cd touchegg/touchegg
  qmake-qt4
  make
}

package() {
  cd touchegg/touchegg
  make INSTALL_ROOT="${pkgdir}" install
}
