# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: getzze <getzze@gmail.com>

_pkgname=mco
_pkgver=1.15.6
pkgname=r-${_pkgname,,}
pkgver=1.15.6
pkgrel=10
pkgdesc='Multiple Criteria Optimization Algorithms and Related Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-scatterplot3d
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('17ebe279cb9c89b7cd8054ac50d3b657d2b10dadbc584b88da7e79c3a9680582')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
