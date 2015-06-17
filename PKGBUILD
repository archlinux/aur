# Contributor: M0Rf30

pkgname=dboxfe2
pkgver=0.1.3
pkgrel=5
pkgdesc="A dosbox frontend"
url="http://chm-projects.de/?q=dboxfe"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
conflicts=('dboxfe')
source=(http://garr.dl.sourceforge.net/project/dboxfe.berlios/dboxfe-$pkgver.tar.bz2)

build() {
  cd $srcdir/dboxfe-$pkgver
  # configure is broken
  qmake-qt4 -o Makefile dboxfe.pro
  make
}

package() {
  cd $srcdir/dboxfe-$pkgver
  install -D -m755 bin/dboxfe $pkgdir/usr/bin/dboxfe
}

md5sums=('1f6224c0eae16502349504e1b722d4aa')
