# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tradeSeq
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='trajectory-based differential expression analysis for sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-biocparallel
  r-edger
  r-ggplot2
  r-igraph
  r-magrittr
  r-matrixstats
  r-pbapply
  r-princurve
  r-rcolorbrewer
  r-s4vectors
  r-singlecellexperiment
  r-slingshot
  r-summarizedexperiment
  r-tibble
  r-trajectoryutils
  r-viridis
)
optdepends=(
  r-clusterexperiment
  r-covr
  r-delayedmatrixstats
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41038bd6c6c1ae6ecaeb7bc530ec0087a4c5c9eb9d3670b53ee7f441f309dfed')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
