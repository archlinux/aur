# Contributor: robertfoster

pkgname=dboxfe2
pkgver=0.1.3
pkgrel=6
pkgdesc="A dosbox frontend"
url="http://chm-projects.de/?q=dboxfe"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
conflicts=('dboxfe')
source=(https://downloads.sourceforge.net/project/dboxfe.berlios/dboxfe-$pkgver.tar.bz2)

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

sha256sums=('a1e8e2fa1b3221f3e7dc14c065e93eede3b9d744d94047118cc730207eb52c5c')
