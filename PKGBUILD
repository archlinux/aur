# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GO.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A set of annotation maps describing the entire Gene Ontology"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-dbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ae5557afa56227c4c9c145907b1f585')
b2sums=('3e3039f6aea264011e19e8747bc822bc3890863122cd13da12d9fd65e0d09b0698f8919fbc55734217fbcb73740ca7e11c55510a41b703d2b5af622d173d7473')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
