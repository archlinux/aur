# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=decoupleR
_pkgver=2.17.0
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
md5sums=('361055d5a87634d1598f7e5a9b772dc7')
b2sums=('b77df826cf0a86e7754d51d3d2944ad89ff2916bb06ec64a4868d29f58e8025c582e07cd252c9ed1dcb8a865e1747364dc53909827aa192821fd8617dbcb308e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
