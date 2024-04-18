# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=canceR
_pkgver=1.36.8
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
md5sums=('760ec8234d7940716eb73b1a554806ab')
b2sums=('79d85b243dea3d49718749299bba9046f320aa39cf3640a5823a6250826d049e7a12c5245b564469eb40d4554006abad0d758a09f86448faba2684cc3cbf8d0d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
