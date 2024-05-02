# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XDE
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=2.50.0
pkgrel=1
pkgdesc='XDE: a Bayesian hierarchical model for cross-study analysis of differential gene expression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-genefilter
  r-genemeta
  r-gtools
  r-mvtnorm
  r-rcolorbrewer
  r-siggenes
)
optdepends=(
  r-coda
  r-mass
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('613b5c9d623828ade7f36f99009b81534bfdcae0b86cb3072c6fd6ec2f540ab8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
