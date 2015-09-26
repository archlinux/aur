# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=emacs-ess
pkgver=15.09
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
replaces=('ess')
provides=('ess')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-$pkgver.tgz")
md5sums=('c0959d5c1607a3723fca7032259bd1d3')
options=('!makeflags')

build() {
  cd $srcdir/ess-$pkgver
  make prefix=/usr
}
package() {
  cd $srcdir/ess-$pkgver
  make DESTDIR=$pkgdir/usr INFODIR=$pkgdir/usr/share/info/ install
}
