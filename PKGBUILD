# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=libdbh2
pkgver=5.0.17
pkgrel=1
pkgdesc="Disk based hashtables"
arch=('i686' 'x86_64')
url="http://sf.net/projects/dbh"
license=('GPL3')
depends=('glibc')
source=(http://downloads.sourceforge.net/project/dbh/dbh/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('7f2e320a77493c222c3258811044f568')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
