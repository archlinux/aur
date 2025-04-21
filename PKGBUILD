# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INDEED
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=2.22.0
pkgrel=1
pkgdesc='Interactive Visualization of Integrated Differential Expression and Differential Network Analysis for Biomarker Candidate Selection Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-devtools
  r-glasso
  r-igraph
  r-visnetwork
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9baad01d0e55bc77ff5bfd0b511b0086d5bfe9e6cd6d4c2bb4cf83495f9be0b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
