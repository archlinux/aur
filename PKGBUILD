# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lefser
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R implementation of the LEfSE method for microbiome biomarker discovery"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-coin
  r-dplyr
  r-ggplot2
  r-s4vectors
  r-summarizedexperiment
  r-ggtree
  r-stringr
  r-testthat
  r-forcats
  r-tibble
  r-tidyr
  r-ape
  r-biocgenerics
  r-ggrepel
  r-mia
  r-purrr
  r-tidyselect
  r-treeio
)

optdepends=(
  r-biocstyle
  r-covr
  r-curatedmetagenomicdata
  r-knitr
  r-phyloseq
  r-pkgdown
  r-rmarkdown
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('11a943a83d06cd40e43db45894509461')
b2sums=('d0592b1243302dfbc3859f67b6a06f1194aa8281eb3234d4fdaa47b1426a12d88b6e549aa0e6621991e06aa51908005dc8a237026bc7ab186fa10184a0e553bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
