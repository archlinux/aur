# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOSemSim
_pkgver=2.32.0
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
md5sums=('91ac358b6d115c6f33062c7e57ca4484')
b2sums=('300323ace59755dd0c041f7e5cee35a6db185a5ad231b7f1dbca28b98ca71e5cd1f0cd7c571dcc564c8f4f58d4b95cb9dc13e1dacd9deda5e30f47f6c222de02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
