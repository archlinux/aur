# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOSemSim
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GO-terms Semantic Similarity Measures"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-dbi
  r-digest
  r-go.db
  r-rcpp
  r-rlang
  r-yulab.utils
)
makedepends=(
)
optdepends=(
  r-annotationhub
  r-biocmanager
  r-biocparallel
  r-clusterprofiler
  r-dose
  r-gson
  r-knitr
  r-org.hs.eg.db
  r-quarto
  r-readr
  r-rocr
  r-testthat
  r-tidyr
  r-tidyselect
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('02792a8116014ca1dbd8e9e38f8feaba')
b2sums=('060d582315ce925bea52a226e51c4df71b3a80399a9bfc99cadc8c82d80d2bbcc67ab5c6847180ec3b3fc1daca8a2f0ce909b0828a51f86640c8cfbb6148e3e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
