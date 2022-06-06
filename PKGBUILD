# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flexclust
_pkgver=1.4-1
pkgname=r-${_pkgname,,}
pkgver=1.4.1
pkgrel=3
pkgdesc='Flexible Cluster Algorithms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-modeltools
)
optdepends=(
  r-clue
  r-cluster
  r-ellipse
  r-seriation
  r-skmeans
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d67977df059e622832358069509f8968d506074320a45d34bfd21c65f898538d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
