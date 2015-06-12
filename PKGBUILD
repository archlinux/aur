# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-core
pkgver=latest
pkgrel=3
pkgdesc="a programming language to create games (Fenix successor) - core"
arch=('i686')
url="http://sourceforge.net/projects/bennugd/"
license=('GPL')
depends=('libdes' 'openssl')
source=("http://bennugd.svn.sourceforge.net/viewvc/bennugd.tar.gz?view=tar")
md5sums=('ee5ca6f6d29066b9a3b3e8a0b182b1b4')

build() {
  cd $srcdir/bennugd/core
  chmod +x ./configure
  ./configure --prefix=/usr
  find . -name Makefile -print0 | xargs -0 sed -i 's/--as-needed//'
  make
}

package() {
  cd $srcdir/bennugd/core
  make DESTDIR=${pkgdir} install
}
