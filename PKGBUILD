# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=rbiom
_pkgver=2.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc="Read/Write, Analyze, and Visualize 'BIOM' Data"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-ape
  r-dplyr
  r-emmeans
  r-fillpattern
  r-ggbeeswarm
  r-ggnewscale
  r-ggplot2
  r-ggrepel
  r-ggtext
  r-jsonlite
  r-magrittr
  r-parallelly
  r-patchwork
  r-pillar
  r-plyr
  r-readr
  r-readxl
  r-slam
  r-vegan
)
optdepends=(
  r-cli
  r-crayon
  r-ggdensity
  r-glue
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
md5sums=('c0a94c1fab4967ba1b414ca54b37bb8f')
b2sums=('135745feaa8c8d414ea0d6acf5d0da357848918c9b3b0b23d9d024053086e4a2c71bc307530c158833438334e757d0162fa37ae2b3e5cdac776b567cc0eb93ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
