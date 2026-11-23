# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=rbiom
_pkgver=3.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Integrated Analysis and Visualization of Microbiome Data"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-ape
  r-dplyr
  r-ecodive
  r-emmeans
  r-fillpattern
  r-ggbeeswarm
  r-ggnewscale
  r-ggplot2
  r-ggrepel
  r-ggtext
  r-jsonlite
  r-magrittr
  r-patchwork
  r-pillar
  r-plyr
  r-readr
  r-readxl
  r-vegan
)
optdepends=(
  r-cli
  r-crayon
  r-ggdensity
  r-glue
  r-h5lite
  r-labeling
  r-lifecycle
  r-openxlsx
  r-optparse
  r-pkgconfig
  r-prettycode
  r-r6
  r-rlang
  r-scales
  r-testthat
  r-tibble
  r-tsne
  r-uwot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd636440ffe2cf207f37ec66b6268e0f')
b2sums=('2aabbf0dbfc8b21552c8d79c6b0a4175fdac8049b80ddf3d902b26798b6e9546cda09139956938ccdc15c4c3877d7560818711a839596863a3fac75e21255772')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
