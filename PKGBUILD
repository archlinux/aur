# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>

pkgname=wcalc
pkgver=2.5
pkgrel=1
pkgdesc="A flexible command-line scientific calculator"
arch=('i686' 'x86_64')
url="http://w-calc.sourceforge.net/"
license=('GPL')
depends=('mpfr')
source=(http://downloads.sourceforge.net/w-calc/$pkgname-$pkgver.tar.bz2)
sha256sums=('0e2c17c20f935328dcdc6cb4c06250a6732f9ee78adf7a55c01133960d6d28ee')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
