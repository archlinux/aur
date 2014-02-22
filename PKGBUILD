# $Id$
# Maintainer: John K. Luebs <jkluebs@luebsphoto.com>
pkgname=xiccd
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple bridge between colord and X"
arch=(i686 x86_64)
url="https://github.com/agalakhov/xiccd"
license=(GPL)
depends=(colord libxrandr)
source=(https://github.com/agalakhov/${pkgname}/archive/v${pkgver}.tar.gz)
sha1sums=('45831c211fe7eafc13c36f0fce9549c42373380d')

build() {
  cd $pkgname-$pkgver

  aclocal
  autoconf
  automake --add-missing --foreign --force --copy
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
