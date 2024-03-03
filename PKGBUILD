# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=canceR
_pkgver=1.36.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Graphical User Interface for accessing and modeling the Cancer Genomics Data of MSKCC"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-cbioportaldata
  r-circlize
  r-dplyr
  r-formula
  r-genetclassifier
  r-gseabase
  r-phenotest
  r-plyr
  r-r.methodss3
  r-r.oo
  r-runit
  r-tidyr
  r-tkrplot
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('02d656dd772b36d0ef1fb08e1357ce2a')
b2sums=('e4cee0719f133e1c0197a7ab9061901c732da139170e0e09c46e5495a43a27606a6d762790c326ebf955b42a9cb7fe232bca4942906d7624e978e8af83f43e4a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
