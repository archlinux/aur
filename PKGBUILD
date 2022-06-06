# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=factoextra
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=1.0.7
pkgrel=3
pkgdesc='Extract and Visualize the Results of Multivariate Data Analyses'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-dendextend
  r-factominer
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-reshape2
  r-tidyr
)
optdepends=(
  r-ade4
  r-ca
  r-igraph
  r-knitr
  r-mass
  r-mclust
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('624ff01c74933352aca55966f8a052b1ccc878f52c2c307e47f88e0665db94aa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
