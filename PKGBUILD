# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEsingle
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='DEsingle for detecting three types of differential expression in single-cell RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bbmle
  r-biocparallel
  r-gamlss
  r-maxlik
  r-pscl
  r-vgam
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('57293c48e9fd3c7775d1c6db59aab6a071a2bfbfe44be411165c7e9f09668498')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
