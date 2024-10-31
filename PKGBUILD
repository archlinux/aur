# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=depmap
_pkgver=1.19.1
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
md5sums=('a8a7f9249e5a6faf5554b00b5858ed51')
b2sums=('86c21d2067af1609005848227d4d069b7647fdf605788c103fd45006c99d67265b37e6e19455ce8cf2dd4478f137549bf154b9389943697857789d432c715785')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
