# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seriation
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc='Infrastructure for Ordering Objects Using Seriation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ca
  r-colorspace
  r-gclus
  r-qap
  r-registry
  r-tsp
)
optdepends=(
  r-dbscan
  r-dendextend
  r-dendser
  r-ga
  r-ggplot2
  r-rtsne
  r-scales
  r-testthat
  r-umap
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ad19ecbc375aa8121b8a60c6bbd0e7b3a5ab2779dab805c72124caa472ff5090')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
