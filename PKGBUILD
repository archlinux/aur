# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ica
_pkgver=1.0-3
pkgname=r-${_pkgname,,}
pkgver=1.0.3
pkgrel=1
pkgdesc='Independent Component Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('474d3530b16b76a1bf1a1114d24092678ea7215fa57c6fdcee6333f1e768b865')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
