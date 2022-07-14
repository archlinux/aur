# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowStats
_pkgver=4.8.2
pkgname=r-${_pkgname,,}
pkgver=4.8.2
pkgrel=1
pkgdesc='Statistical methods for the analysis of flow cytometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-fda
  r-flowcore
  r-flowviz
  r-flowworkspace
  r-ks
  r-ncdfflow
  r-rcolorbrewer
  r-rrcov
  r-mnormt
  r-corpcor
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
sha256sums=('ac515efa940424fbaec08504f470c1899a9d321d4295cbc0e5037617cb7b01f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
