# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DelayedDataFrame
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Delayed operation on DataFrame using standard DataFrame metaphor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-s4vectors
)
optdepends=(
  r-gdsarray
  r-knitr
  r-rmarkdown
  r-seqarray
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13d6a595c77e2d47b1507a2fa0de5738a07822f05e813f4091a6c9606544c600')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
