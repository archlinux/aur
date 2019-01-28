# Maintainer: Arvedui <arvedui@posteo.de>
# Contributer: Philipp Moeller <bootsarehax@gmail.com>

pkgname=ddate
pkgver=0.2.2
pkgrel=3
pkgdesc="PERPETUAL DATE CONVERTER FROM GREGORIAN TO POEE CALENDAR"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/bo0ts/ddate"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/bo0ts/ddate/archive/v${pkgver}.tar.gz)

md5sums=('154ead3444d60806c97919b4f3d69e19')

build() {
  cd $srcdir/ddate-${pkgver}/
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make PREFIX="/usr"
}

package() {
  cd $srcdir/ddate-${pkgver}/
  make DESTDIR="$pkgdir" install
}

