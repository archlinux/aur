# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=decoupleR
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ensemble of computational methods to infer biological activities from omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-broom
  r-dplyr
  r-magrittr
  r-parallelly
  r-purrr
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-withr
)
optdepends=(
  r-aucell
  r-biocstyle
  r-covr
  r-fgsea
  r-ggplot2
  r-ggrepel
  r-glmnet
  r-gsva
  r-knitr
  r-magick
  r-omnipathr
  r-patchwork
  r-pheatmap
  r-pkgdown
  r-ranger
  r-refmanager
  r-rmarkdown
  r-roxygen2
  r-sessioninfo
  r-seurat
  r-summarizedexperiment
  r-testthat
  r-viper
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('89cf6170805e24c71b990658aeba2a82')
b2sums=('cb4280a9997553ad3ad4effa0722aaab01a5f9ab73a245dff046b41c3474df2670c65a2666883bbcc19457c929e10f51cdda72a8a1c1ae66b60f2008f6bd1021')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
