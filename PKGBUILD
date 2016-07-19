# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=vms-empire
pkgver=1.14
pkgrel=1
pkgdesc="Empire is a simulation of a full-scale war between two emperors, the computer and you."
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/vms-empire/"
license=('GPL')
depends=('ncurses')
makedepends=('xmlto')
source=(
  http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz
)
md5sums=('9defc2be52380171f293b5bfb4c5fa28')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^install: empire.6 uninstall/install: empire.6/' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
