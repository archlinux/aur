# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=depmap
_pkgver=1.28.0
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
md5sums=('56bacf843ee7307246d0924c122b1b0f')
b2sums=('f56542fc4dd6ab23ec195b825775ddc58cc380b7da60a19c1a099a3c61ec4ad5a1324ef925cd2219871d91aa1d38af48ad1d6d153995b3426310d226d2d60451')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
