# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=libdbh2
pkgver=5.0.19
pkgrel=1
pkgdesc="Disk based hashtables"
arch=('i686' 'x86_64')
url="http://sf.net/projects/dbh"
license=('GPL3')
depends=('glibc')
source=(http://downloads.sourceforge.net/project/dbh/dbh/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('68098c2920c7bc099ba35632bc018c25')

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
