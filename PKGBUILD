# Contributor: Jan de Groot <jan@jgc.homeip.net>

pkgname=libgdamm
pkgver=3.99.17
pkgrel=1
pkgdesc="A C++ interface for libgda"
arch=('i686' 'x86_64')
depends=('libgda>=4.0.5' 'glibmm>=2.22.1')
url="http://gtkmm.sourceforge.net/"
license=('LGPL')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/3.99/$pkgname-$pkgver.tar.bz2)

build() {
  cd $srcdir/$pkgname-$pkgver
  #sed -e 's|glibmm-2.4|glibmm-2.20|' -i configure
  #sed -e 's|glibmm-2.4|glibmm-2.20|' -i configure.in
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
md5sums=('8239fb66c02a35064b7015921fa838cf')
