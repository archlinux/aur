# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=depmap
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cancer Dependency Map Data Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocfilecache
  r-curl
  r-dplyr
  r-experimenthub
  r-httr2
  r-tibble
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-gridextra
  r-knitr
  r-magick
  r-readr
  r-rmarkdown
  r-stringr
  r-tidyverse
  r-viridis
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7570708bfa0edac82ad43e8f73600460')
b2sums=('d84619d2f454bb6104183439dbc75736e9e3bf3d4a7c1aca32b90814a33ebefbbaca09184f05c0035ca86970f9bb6a663ef51802597dfcf52504f0c3ed09aacc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
