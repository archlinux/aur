# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOSemSim
_pkgver=2.30.1
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
  r-httr2
  r-rlang
  r-yulab.utils
)
makedepends=(
  r-rcpp
)
optdepends=(
  r-annotationhub
  r-biocmanager
  r-clusterprofiler
  r-dose
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-r.utils
  r-rappdirs
  r-readr
  r-rmarkdown
  r-rocr
  r-testthat
  r-tidyr
  r-tidyselect
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('377099636424a2bc28b6a004a80823cf')
b2sums=('6146e260d3846011d982f28b3f5f77b198f622f5ab3ef1de3e1e905d71407df3aa91f90b0f339fb7d025f60c60ff9403da1ebba4275ff9d66c62359ffbc74ab7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
