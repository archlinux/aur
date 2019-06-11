# $Id$
# Maintainer: John K. Luebs <jkluebs@luebsphoto.com>
pkgname=xiccd
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple bridge between colord and X"
arch=(i686 x86_64)
url="https://github.com/agalakhov/xiccd"
license=(GPL)
depends=(colord libxrandr)
source=(https://github.com/agalakhov/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('94dbe352ad3043079fa5edd8150318ec88f1dc87b75f69b1fced8ce2981c36a9')

build() {
  cd $pkgname-$pkgver

  aclocal
  autoconf
  automake --add-missing --foreign --force --copy
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
