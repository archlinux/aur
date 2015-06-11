# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmtop
pkgver=0.84
pkgrel=3
pkgdesc="wmapplet for monitoring cpu usage"
arch=('i686' 'x86_64')
license=('GPL')
url="http://wmtop.sourceforge.net/"
depends=('libxpm')
makedepends=('xorg-server')
source=("http://downloads.sourceforge.net/wmtop/wmtop-0.84.tar.bz2")
md5sums=('2bab22c5bc3a5b887e7c03d6dbfe59d7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make linux
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 wmtop "$pkgdir/usr/bin/wmtop"
  install -Dm0644 wmtop.1 "$pkgdir/usr/share/man/man1/wmtop.1"
}

# vim: set sw=2 et:
