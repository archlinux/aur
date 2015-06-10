# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=libtubo0
pkgver=5.0.15
pkgrel=1
pkgdesc="Tubo remote process execution library"
arch=('i686' 'x86_64')
url="http://xffm.org/"
license=('GPL3')
depends=('glibc')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/xffm/libtubo/$pkgname-$pkgver.tar.bz2)
md5sums=('591b7000c50cd48ed380b05b98ef2bcb')

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
