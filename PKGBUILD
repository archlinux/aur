# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XDE
_pkgver=2.46.0
pkgname=r-${_pkgname,,}
pkgver=2.46.0
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
sha256sums=('d5cc8ab6e120fa3d7b98f2e5cd0ce225182fd64787fb22a6e833714de45cd724')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
