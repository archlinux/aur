# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MWASTools
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('e7f057d631c76061168fba94c54470cf3911f97a1b13aa86699c1e5b61bf62cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
