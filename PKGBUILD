# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=emacs-ess
pkgver=15.03.1
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
replaces=('ess')
provides=('ess')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-15.03-1.tgz")
md5sums=('36ddd32daa346a36660cce176e36e617')

build() {
  cd $srcdir/ess-15.03-1
  make prefix=/usr
}
package() {
  cd $srcdir/ess-15.03-1
  make DESTDIR=$pkgdir/usr INFODIR=$pkgdir/usr/share/info/ install
}
