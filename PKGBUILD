# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=canceR
_pkgver=1.36.6
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
md5sums=('ec347b44b50e7c46233a4130b081a5fe')
b2sums=('2460c568959fffc270f6d42f0e2ac6a30c26be661b832c05a684fcc3bc91da54dafc4fcd4925c8237b4427047aba4c3ba3d776ef74f610d92cc5f8170975eae2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
