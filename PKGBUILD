# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dendextend
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('8853739d3aa29498803e462d1ef12dae840bf63ec57d7b4d456bfd6d8fd538a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
