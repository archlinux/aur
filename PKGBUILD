# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=fllog
pkgver=1.2.1
pkgrel=1
pkgdesc="An Amateur Radio Logbook"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL')
depends=('fltk')
makedepends=()
source=(http://downloads.sourceforge.net/project/fldigi/fllog/${pkgname}-${pkgver}.tar.gz)

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
sha512sums=('32c9d2693c35b857bd313d25e2bee555b70c8708f6c1bf5319287df043b58b027e91d1f2b38d8dd62ec9c7ef6b19ea77fa282e98f14f4a4256907ce6c7a23c38')
