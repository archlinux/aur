# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=fllog
pkgver=1.2.0
pkgrel=1
pkgdesc="An Amateur Radio Logbook"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL')
depends=('fltk')
makedepends=()
source=(http://www.w1hkj.com/downloads/fllog/$pkgname-$pkgver.tar.gz)
sha256sums=('7cac198e0e9def5853a6b3df1ad1968752a90f0d2d3477e071567fdde4c436d3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
