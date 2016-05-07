# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=emacs-ess
pkgver=16.04
_pkgver=16.04
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
md5sums=('d68f92b30261a8b51a56f5c20424d922')
options=('!makeflags')

build() {
  cd $srcdir/ess-$_pkgver
  make prefix=/usr
}
package() {
  cd $srcdir/ess-$_pkgver
  make DESTDIR=$pkgdir/usr INFODIR=$pkgdir/usr/share/info/ install
}
