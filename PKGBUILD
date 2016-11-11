# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=emacs-ess
pkgver=16.10
pkgrel=2
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
makedepends=('wget')
replaces=('ess')
provides=('ess')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-${pkgver}.tgz")
md5sums=('e6472605e5f1cbb54e6bc000bca62939')
options=('!makeflags')

build() {
  cd $srcdir/ess-$pkgver
  make prefix=/usr
}
package() {
  cd $srcdir/ess-$pkgver
  make DESTDIR=$pkgdir/usr INFODIR=$pkgdir/usr/share/info/ install
}
