# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gtk2+extra
pkgver=2.1.1
pkgrel=3
pkgdesc="GtkExtra is a useful set of widgets for creating GUI's for the Xwindows system using GTK+"
arch=(i686 x86_64)
url="http://gtkextra.sourceforge.net/"
depends=('gtk2')
license=('LGPL')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/scigraphica/gtk+extra-$pkgver.tar.gz
	gtksheet_unref.patch
	gtk2-2.18.3-build-fix.patch)
md5sums=('1a933ca1286829383a0554cc2deb9e04'
         '1de26cb2b3cda627639ab30d3f8a4669'
         '3f6275dc5345338084ab53a56bd8a8fc')

build() {
  cd $startdir/src/gtk+extra-$pkgver
  patch -Np0 -i ../gtksheet_unref.patch
  patch -Np1 -i ../gtk2-2.18.3-build-fix.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
