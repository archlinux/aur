# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Christian von Essen <christian@mvonessen.de>
pkgname=wmwave
pkgver=0.4
pkgrel=3
pkgdesc="dockapp to display statistical information about a current wifi connection"
arch=('x86_64' 'i686')
url="http://wmwave.sourceforge.net"
license=('GPL')
depends=('libxpm')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-0-4.tgz"
        'Makefile')
md5sums=('8728507eccb01a9749336f53ac4182c5'
         '42eb9b6dbbe9d3edb12637384cba02ca')
build() {
  cp "$srcdir/Makefile" "$srcdir/$pkgname/"
  cd "$srcdir/$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

