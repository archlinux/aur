# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MWASTools
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='MWASTools: an integrated pipeline to perform metabolome-wide association studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-car
  r-complexheatmap
  r-ggplot2
  r-glm2
  r-gridextra
  r-igraph
  r-kegggraph
  r-keggrest
  r-ppcor
  r-qvalue
  r-rcurl
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a034b3e0af24ed971281a975a05a95a8d0c69e684365c168623c465820659e4e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
