# Maintainer: Michael Fellinger <m.fellinger@gmail.com>
pkgname=vms-empire
pkgver=1.11
pkgrel=1
pkgdesc="Empire is a simulation of a full-scale war between two emperors, the computer and you."
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/vms-empire/"
license=('GPL')
depends=('ncurses')
source=(
  http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz
)
md5sums=('55c3e79e249c1664b8323e4645ab0be1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 empire.6 "$pkgdir/usr/share/man/man6/empire.6"
  install -D -m755 vms-empire "$pkgdir/usr/bin/vms-empire"
}

# vim:set ts=2 sw=2 et:
