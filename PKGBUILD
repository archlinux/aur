# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HPAStainR
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Queries the Human Protein Atlas Staining Data for Multiple Proteins and Genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-data.table
  r-dplyr
  r-scales
  r-shiny
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocmanager
  r-hpar
  r-knitr
  r-qpdf
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f5a4a3cb194bcbb4474410821cb381e')
b2sums=('de72c7b2021b9bc14ea2e633fb5048c3a5422a663db660a3fff0612da7d3c3b29508e9d4ee8d89547070513ad322f1bdd104795b6728be93662764ec23606586')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
