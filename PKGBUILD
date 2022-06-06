# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PFP
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Pathway Fingerprint Framework in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterprofiler
  r-ggplot2
  r-graph
  r-igraph
  r-kegggraph
  r-magrittr
  r-plyr
  r-tidyr
)
optdepends=(
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('09b86f7bc69f27793e332337ebe35b2a1e5e5c6809940869e1b63e2270acf4b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
