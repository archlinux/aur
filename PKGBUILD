# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=ggpubr
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=0.5.0
pkgrel=3
pkgdesc="'ggplot2' Based Publication Ready Plots"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-ggsci
  r-ggsignif
  r-glue
  r-gridextra
  r-magrittr
  r-polynom
  r-purrr
  r-rlang
  r-rstatix
  r-scales
  r-tibble
  r-tidyr
)
optdepends=(
  r-grdevices
  r-gtable
  r-knitr
  r-rcolorbrewer
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb21a091c7b866b2d35529ca218ce876051c31d3c9e4a68f3c6b297d591e7539')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
