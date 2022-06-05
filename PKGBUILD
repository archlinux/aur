# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClassifyR
_pkgver=3.0.3
pkgname=r-${_pkgname,,}
pkgver=3.0.3
pkgrel=3
pkgdesc='A framework for cross-validated classification problems, with applications to differential variability and differential distribution testing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-locfit
  r-multiassayexperiment
  r-plyr
  r-s4vectors
  r-randomforest
)
optdepends=(
  r-biocstyle
  r-car
  r-class
  r-cowplot
  r-e1071
  r-edger
  r-genefilter
  r-ggplot2
  r-glmnet
  r-gridextra
  r-gtable
  r-htmltools
  r-iranges
  r-knitr
  r-limma
  r-pamr
  r-parathyroidse
  r-poiclaclu
  r-rmarkdown
  r-rmixmod
  r-robustbase
  r-scales
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('15115bd2058bba6a79d42a2e48b7175df23ddb6e0f08971cab9b893d028944a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
