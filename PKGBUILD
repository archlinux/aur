# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=graphlayouts
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=1.0.2
pkgrel=1
pkgdesc='Additional Layout Algorithms for Network Visualizations'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-igraph
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-ggplot2
  r-ggraph
  r-knitr
  r-oaqc
  r-rmarkdown
  r-testthat
  r-uwot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55c95490bc0625ea2fc187f58dc20ee4df325cc93b7987da5d0d5dc96692e0d5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
