# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=fllog
pkgver=1.2.4
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
sha512sums=('20a827655a2db5e6c4f1fb17b637f31bf7aaceeaaeef9c3b8af4d295aa3d29cae65f81bbf71a489a9f7305146071096cb045805bf7947431d8a283234846f2f3')
