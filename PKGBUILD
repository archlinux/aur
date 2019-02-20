# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=s6-portable-utils
pkgver=2.2.1.2
pkgrel=1
pkgdesc="Tiny portable generic utilities"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-portable-utils"
license=('custom:ISC')
makedepends=(skalibs glibc)
source=(${url}/${pkgname}-$pkgver.tar.gz)
sha256sums=('30a23761c77ba2a523100b4ab645796df4d5665f4ab4347d68cfbb7cc03fc745')

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
