# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=emacs-ess
pkgver=15.09.1
_pkgver=15.09-1
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
replaces=('ess')
provides=('ess')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-${_pkgver}.tgz")
md5sums=('24a0007e36161904700a754698d0c52a')
options=('!makeflags')

build() {
  cd $srcdir/ess-$_pkgver
  make prefix=/usr
}
package() {
  cd $srcdir/ess-$_pkgver
  make DESTDIR=$pkgdir/usr INFODIR=$pkgdir/usr/share/info/ install
}
