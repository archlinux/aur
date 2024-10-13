# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dendextend
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=1.18.1
pkgrel=1
pkgdesc="Extending 'dendrogram' Functionality in R"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-magrittr
  r-viridis
)
optdepends=(
  r-ape
  r-circlize
  r-cluster
  r-colorspace
  r-corrplot
  r-covr
  r-data.table
  r-dendroextras
  r-dendser
  r-distory
  r-dynamictreecut
  r-fpc
  r-ggdendro
  r-gplots
  r-heatmaply
  r-hmisc
  r-knitr
  r-mass
  r-microbenchmark
  r-modulecolor
  r-phangorn
  r-pvclust
  r-rmarkdown
  r-rpart
  r-seriation
  r-testthat
  r-wgcna
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9d87a293a73e9399210cad62a4afc24ef4ce71e80bff05d5e74315428dd5a517')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
