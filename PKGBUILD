# $Id: PKGBUILD 194793 2016-11-06 20:26:05Z bpiotrowski $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>

pkgname=gnucap
pkgver=20091207
_pkgver=2009-12-07
pkgrel=5
pkgdesc="GNU Circuit Analysis Package"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gcc-libs' 'readline')
source=(http://gnucap.org/devel/archive/$pkgname-$_pkgver.tar.gz)
sha1sums=('a64be626b3e971437d677f14bc72eda0df6e7e3a')

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
