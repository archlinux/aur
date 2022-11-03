# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nethet
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='A bioconductor package for high-dimensional exploration of biological network heterogeneity'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-compquadform
  r-genenet
  r-ggm
  r-ggplot2
  r-glasso
  r-glmnet
  r-gsa
  r-huge
  r-icsnp
  r-limma
  r-mclust
  r-multtest
  r-mvtnorm
  r-network
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eb255d6f67fdad30bed02d2f8acbea724dd33c7824791b529f640420e1951e36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
