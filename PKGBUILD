# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOSemSim
_pkgver=2.30.2
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
md5sums=('e69d41b74ff770e54f06d84bf33565da')
b2sums=('2c6b17e8d2465835a55f95d4f1c3fffa6539edd98c03ae7abed83dd57b16e92e079c682c6df9c770f065ff9f3a28d3e0c70c4fab4508a8d1a0ed6311cc0d1a61')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
