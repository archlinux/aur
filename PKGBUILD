# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=libceed
pkgver=0.3
pkgrel=1
pkgdesc="Performance Visualization for Parallel Program"
arch=('i686' 'x86_64')
url="http://ceed.exascaleproject.org/ceed-code"
makedepends=('gcc-fortran')
license=('BSD')
source=("https://github.com/CEED/libCEED/archive/v${pkgver}.tar.gz")
md5sums=('dd29bf09b0a2f826c6484862a6662976')

build() {
  cd ${srcdir}/libCEED-${pkgver}
  make
}

package() {
  cd ${srcdir}/libCEED-${pkgver}
  make DESTDIR="$pkgdir" prefix=/usr install
}
