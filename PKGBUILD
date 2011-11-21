# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gtk2+extra
pkgver=2.1.2
pkgrel=1
pkgdesc="GtkExtra is a useful set of widgets for creating GUI's for the Xwindows system using GTK+"
arch=(i686 x86_64)
url="http://gtkextra.sourceforge.net/"
depends=('gtk2')
license=('LGPL')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/gtkextra/$pkgver/gtk%2Bextra-$pkgver.tar.gz
	build-fix.patch)
md5sums=('10779394f39d39115fa3fd0f3dea4436'
         '114c10e7dc14dc78fc38189ee82fa225')

build() {
  cd $srcdir/gtk+extra-$pkgver
  patch -p1 <$srcdir/build-fix.patch
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
