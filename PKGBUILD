# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=canceR
_pkgver=1.36.3
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
md5sums=('2e044cafedb167227aa757d494a7cb1f')
b2sums=('9790eed0be76ac4838847ed45ae25d1181d886232f4b9a7b4181fbd42c0923af649c1c90cd8f54d4941d6e35eb4e78edd61626bb8029534fc67de891b6606337')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
