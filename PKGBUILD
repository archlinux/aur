# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=canceR
_pkgver=1.36.2
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
  r-formula
  r-genetclassifier
  r-gseabase
  r-phenotest
  r-plyr
  r-r.methodss3
  r-r.oo
  r-runit
  r-tkrplot
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7d3c7532e79982ee5db6e3aa3788381e')
b2sums=('1684e18f87b95f7650924a48df3c2263d3ab7f610b5718d3d8429311b08ca50cb87044cb837e34bf6269e377aaf1d93c50aebd4b72118385601681c9a72f1b13')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
