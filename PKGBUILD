# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=libdbh2
pkgver=5.0.22
pkgrel=1
pkgdesc="Disk based hashtables"
arch=('i686' 'x86_64')
url="http://sf.net/projects/dbh"
license=('GPL3')
depends=('glibc')
source=(http://downloads.sourceforge.net/project/dbh/dbh/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('f8c592f6fd4d336cbb5529dc52177e4f')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make V=0
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
