# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=condiments
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Differential Topology, Progression and Differentiation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-dplyr
  r-ecume
  r-igraph
  r-magrittr
  r-matrixstats
  r-pbapply
  r-rann
  r-singlecellexperiment
  r-slingshot
  r-summarizedexperiment
  r-trajectoryutils
  r-distinct
)
optdepends=(
  r-covr
  r-ggplot2
  r-knitr
  r-randomforest
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-tidyr
  r-tscan
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7c705ee4747916d3dc0e778382f9bd23c2008c78f1e824b8e5df467279b6c171')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
