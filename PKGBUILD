# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPAtest
_pkgver=3.1.2
pkgname=r-${_pkgname,,}
pkgver=3.1.2
pkgrel=4
pkgdesc='Score Test and Meta-Analysis Based on Saddlepoint Approximation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3d74ed2b0a6475a9966dd50eb5d363d0b2985636271dfbf82f0472b8d22b9f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
