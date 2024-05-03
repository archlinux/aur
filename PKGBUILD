# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefilter
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="methods for filtering genes from high-throughput experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotate
  r-annotationdbi
  r-biobase
  r-matrixgenerics
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-all
  r-biocstyle
  r-hgu95av2.db
  r-knitr
  r-rcolorbrewer
  r-roc
  r-tkwidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c5047689b3712935e2db374eb3bcc95')
b2sums=('5d16ef3e9bc14b064e602eb9290a12b541d5243eea071ed83b536fa9236917a14b29c5f8eac464aadc6f8daf51cb26f3009f9c6d8a91cdac6e4591e3b9e7df41')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
