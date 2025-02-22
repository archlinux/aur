# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gtk2+extra
pkgver=3.3.4
pkgrel=3
pkgdesc="GtkExtra is a useful set of widgets for creating GUI's for the Xwindows system using GTK+"
arch=(x86_64)
url="http://gtkextra.sourceforge.net/"
depends=('gtk2')
makedepends=('glib2-devel')
license=('LGPL')
source=(https://downloads.sourceforge.net/project/gtkextra/${pkgver%.*}/gtkextra-$pkgver.tar.gz)
sha256sums=('651b738a78edbd5d6ccb64f5a256c39ec35fbbed898e54a3ab7e6cf8fd82f1d6')

build() {
  cd "$srcdir"/gtkextra-$pkgver
  export CFLAGS="$CFLAGS -Wno-implicit-function-declaration"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gtkextra-$pkgver
  make DESTDIR="$pkgdir" install
}
