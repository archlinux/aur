# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowStats
_pkgver=4.14.1
pkgname=r-${_pkgname,,}
pkgver=4.14.1
pkgrel=1
pkgdesc='Statistical methods for the analysis of flow cytometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-clue
  r-corpcor
  r-fda
  r-flowcore
  r-flowviz
  r-flowworkspace
  r-ks
  r-mnormt
  r-ncdfflow
  r-rcolorbrewer
  r-rrcov
)
optdepends=(
  r-ggcyto
  r-ggridges
  r-graph
  r-opencyto
  r-rbgl
  r-testthat
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05505ac37e556010c7388a3924c874973d37995b5d62223ae0c060adb23295e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
