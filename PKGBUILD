# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=gtkperf
pkgver=0.40
pkgrel=5
pkgdesc="An application designed to test GTK+ performance"
arch=('x86_64')
url="http://gtkperf.sourceforge.net"
license=("GPL")
depends=('gtk2')
source=(http://downloads.sourceforge.net/sourceforge/gtkperf/gtkperf_$pkgver.tar.gz)
md5sums=('4331dde4bb83865e15482885fcb0cc53')

build() {
  cd "$srcdir"/$pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/doc "$pkgdir"/usr/share/
}
