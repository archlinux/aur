# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsLOBD
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Assay characterization: estimation of limit of blanc(LoB) and limit of detection(LOD)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-minpack.lm
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-covr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d827e524edf1ae7a6e6d514eb49b69e8e13fe98b3623ca6760799b53c7dd77df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
