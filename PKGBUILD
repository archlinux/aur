# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsebn
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=0.1.2
pkgrel=4
pkgdesc='Learning Sparse Bayesian Networks from High-Dimensional Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ccdralgorithm
  r-discretecdalgorithm
  r-sparsebnutils
)
optdepends=(
  r-graph
  r-igraph
  r-knitr
  r-mvtnorm
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85f1b4c912ed27db5ac4ae7defcfb79ddc7494be1df7239499ac573b6c0026ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
