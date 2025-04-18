# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOSemSim
_pkgver=2.34.0
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
  r-r.utils
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
  r-rappdirs
  r-readr
  r-rmarkdown
  r-rocr
  r-testthat
  r-tidyr
  r-tidyselect
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('32b39cf7fe8d308018ede3dccd0694ce')
b2sums=('4f97ccef9a1991d0ece9e9b75dbd49aa9f5d19eb7c9d9bef084b85bef71c1b77ddd4b19d51db5389702ea5199935995f6618115137572c393b99618419bb728c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
