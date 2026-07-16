# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=depmap
_pkgver=1.26.0
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
md5sums=('be7ecb81eaf97034fb2925122349a4b8')
b2sums=('b1e4a9d6addcdcf77f9bfa882f2e5e72f712acaf314dcd4b0a1ff5e7c3f35e6b4fae1144a897c1f74f414bc400982ce68108cbe330d442b3ab978c75665f2950')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
