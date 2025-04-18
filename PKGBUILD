# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=slingshot
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=1
pkgdesc='Tools for ordering single-cell sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-igraph
  r-matrixstats
  r-princurve
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-trajectoryutils
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-clusterexperiment
  r-covr
  r-delayedmatrixstats
  r-knitr
  r-mclust
  r-mgcv
  r-rcolorbrewer
  r-rgl
  r-rmarkdown
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f5e1ad6b2d1211ea9cdf43b35d315f58fbf078f95da320282b86eb565acd499f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
