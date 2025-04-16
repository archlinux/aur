# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=JASPAR2016
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for JASPAR 2016"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('73faf7ffe379ad6547e5050e2381ba54')
b2sums=('60525bbb7e5ef70da4700b86fe8a90ccda84afbe4f713e6eca43efa23055f5a49ed3cca75d5d509657e3369bb2fbfaf18384867427ec7444a9e5faa4bc005803')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
