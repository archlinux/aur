# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Kaspar Bumke <kaspar.bumke@gmail.com>

pkgname=easy_spice
pkgver=0.6.8
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Electronic circuit simulator (SPICE frontend, using gschem for schematics and ngspice as simulator)"
url="http://easy-spice.sourceforge.net/"
license="GPL"
depends=('geda-gaf' 'gtk2' 'ngspice' 'xterm')
source=(http://downloads.sourceforge.net/sourceforge/easy-spice/$pkgname-$pkgver.tar.gz)
md5sums=('6ffaab8c2dcdfc30ecdca52f3c8bcded')

build() {
  cd $pkgname-$pkgver
  LIBS="$LIBS /lib/libm.so.6" LDFLAGS="$LDFLAGS -lm" ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

