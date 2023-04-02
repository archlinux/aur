# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=s6-portable-utils
pkgver=2.3.0.2
pkgrel=1
pkgdesc="Tiny portable generic utilities"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-portable-utils"
license=('custom:ISC')
depends=('skalibs')
makedepends=(glibc)
source=(${url}/${pkgname}-$pkgver.tar.gz)
sha256sums=('8714269134f012650daac040e5646372dea5658b9c0d89a7ca03bb2abec4d1e8')

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
