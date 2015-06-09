# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
# I don't provide Packages for a higher version because they are not open source anymore (somehow)

pkgname=fruit
pkgver=2.1
pkgrel=2
pkgdesc="Fruit is a suprisingly strong, minimalistic chess engine"
url="http://wbec-ridderkerk.nl/html/details1/Fruit.html"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('gcc')
source=(http://wbec-ridderkerk.nl/html/downloada/$pkgname/${pkgname}_21.zip)
md5sums=(52828a94ecdf8a50127516a53e9ee2d0)

build() {
  cd ${srcdir}/${pkgname}_21/src/
  make || return 1
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cp ${srcdir}/${pkgname}_21/src/fruit ${pkgdir}/usr/bin/
}

