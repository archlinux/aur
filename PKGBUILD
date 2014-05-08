# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmfsm
pkgver=0.31
pkgrel=1
pkgdesc="A dock app showing the free space across your filesystems"
arch=('i686' 'x86_64')
url="http://wmfsm.netpedia.net/"
license=('GPL')
depends=('libxpm')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmfsm-0.31.tar.gz")
md5sums=('9b47b44ed9102b8b659168383a0c379e')

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 wmfsmrc.sample "$pkgdir/usr/share/X11/$pkgname/system.wmfsmrc"
  install -Dm0644 wmfsmrc.sample "$pkgdir/etc/skel/.wmfsmrc"
}

# vim: set sw=2 et:
