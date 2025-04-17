# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=decoupleR
_pkgver=2.14.0
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
md5sums=('3c01e61e7d61fc7a068bb64e8fe70462')
b2sums=('c6fd63c2e7681b2afd2c90b5031a629025fb38223eca36538262ee7ba966d315d80b3e5f6b3a197fb95a32cbcd22320ac1cb5bdc54ee7ea90d85a0c9b9768ec6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
