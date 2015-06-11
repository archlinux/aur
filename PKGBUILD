# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmbinclock
pkgver=0.5
pkgrel=3
pkgdesc="A dockable WindowMaker app (docklet) binary clock."
arch=('i686' 'x86_64')
url="http://wmbinclock.sourceforge.net/" 
license=('GPL')
depends=('libxpm')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('ba268e66b59b100edb9da1cee064c258')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr" install
}
