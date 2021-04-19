# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=s6-portable-utils
pkgver=2.2.3.2
pkgrel=1
pkgdesc="Tiny portable generic utilities"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-portable-utils"
license=('custom:ISC')
depends=('skalibs')
makedepends=(glibc)
source=(${url}/${pkgname}-$pkgver.tar.gz)
sha256sums=('6627a2d3ea263539e83512a36f10a587fa0dd5e899bc3612187e9e3b9faf769c')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr \
              --datadir=/etc
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
