# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=libtubo0
pkgver=5.0.14
pkgrel=1
pkgdesc="Tubo remote process execution library"
arch=('i686' 'x86_64')
url="http://xffm.org/"
license=('GPL3')
depends=('glibc')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/xffm/libtubo/$pkgname-$pkgver.tar.gz)
md5sums=('ed9a1339ebb31b9913b1dee914656883')

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
