# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=psftools
pkgver=1.0.14
pkgrel=1
pkgdesc="Utilities for manipulation of console fonts in PSF format"
arch=('i686' 'x86_64')
url="http://www.seasip.info/Unix/PSF/"
license=('GPL')
depends=('glibc')
options=('!libtool')
source=(http://www.seasip.info/Unix/PSF/$pkgname-${pkgver}.tar.gz)
md5sums=('6e8275ca456793898b974cce084b38ec')

build() {
  cd  "$srcdir"/$pkgname-$pkgver
  export CPPFLAGS="-O2"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd  "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
