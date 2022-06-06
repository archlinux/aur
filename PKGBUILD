# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Matching
_pkgver=4.10-2
pkgname=r-${_pkgname,,}
pkgver=4.10.2
pkgrel=3
pkgdesc='Multivariate and Propensity Score Matching with Balance Optimization'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-parallel
  r-rbounds
  r-rgenoud
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e75dc61553c1687b2b520dc52688409c2e84285e4b6c16c94d8d85fd5ccece0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
