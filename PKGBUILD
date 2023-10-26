# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nethet
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('12ea69f6eece283c169874ced85c70a4d3401094830a732730ffd178fcdc464b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
