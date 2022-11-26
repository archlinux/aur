# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=changepoint
_pkgver=2.2.4
pkgname=r-${_pkgname,,}
pkgver=2.2.4
pkgrel=3
pkgdesc='Methods for Changepoint Detection'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-zoo
)
optdepends=(
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ac636fde7610137385dde1e3d8a22a2ff856a8d5c917c7ad1a5cc49f98b8649b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
