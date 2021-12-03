# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmbinclock
pkgver=0.51
pkgrel=3
pkgdesc="A dockable WindowMaker app (docklet) binary clock."
arch=('i686' 'x86_64')
url="http://wmbinclock.sourceforge.net/" 
license=('GPL')
depends=('libxpm')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('72b4932c4d09ead0ff6d8b3e656f1c6a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CFLAGS="$CFLAGS -fcommon -Wno-format-security" SYSTEM="$LDFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr" install
}
