# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=s6-portable-utils
pkgver=2.2.3.0
pkgrel=1
pkgdesc="Tiny portable generic utilities"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/s6-portable-utils"
license=('custom:ISC')
makedepends=(skalibs glibc)
source=(${url}/${pkgname}-$pkgver.tar.gz)
sha256sums=('29baab7ca8d5c97cb5f311f4ad359ecee4ed13249fb51e351f4bbc175de47f18')

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
