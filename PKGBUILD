# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=graphite
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='GRAPH Interaction from pathway Topological Environment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-annotationdbi
  r-graph
  r-httr
  r-purrr
  r-rappdirs
  r-rlang
)
optdepends=(
  r-a4preproc
  r-all
  r-biocstyle
  r-checkmate
  r-clipper
  r-codetools
  r-hgu133plus2.db
  r-hgu95av2.db
  r-impute
  r-knitr
  r-org.hs.eg.db
  r-parallel
  r-r.rsp
  r-rcy3
  r-rmarkdown
  r-spia
  r-testthat
  r-topologygsa
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('050b911ee969c5d31293e82f750f3b3454aaecb7b8395d2264f89862e89b12ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
