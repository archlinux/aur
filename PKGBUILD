# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=LoopTools
pkgname=looptools
pkgver=2.13
pkgrel=1
pkgdesc="package for evaluation of scalar and tensor one-loop integrals"
arch=("i686" "x86_64")
url="http://www.feynarts.de/looptools"
license=('GPL')
depends=("gcc-fortran")
source=("http://www.feynarts.de/looptools/${_pkgname}-$pkgver.tar.gz")
sha256sums=('8065eb9b7546cea34a9ad77d67f4efd440a58c6548e66e7f1761ecee41605bc3')

build() {
  cd "${_pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
