# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gtk2+extra
pkgver=3.3.3
pkgrel=1
pkgdesc="GtkExtra is a useful set of widgets for creating GUI's for the Xwindows system using GTK+"
arch=(i686 x86_64)
url="http://gtkextra.sourceforge.net/"
depends=('gtk2')
license=('LGPL')
source=(http://downloads.sourceforge.net/project/gtkextra/${pkgver%.*}/gtkextra-$pkgver.tar.gz)
sha256sums=('7889f958ee9fb6bd564aa941891909c3af7a03b92e232c5a90bab0289407d884')

build() {
  cd "$srcdir"/gtkextra-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gtkextra-$pkgver
  make DESTDIR="$pkgdir" install
}
