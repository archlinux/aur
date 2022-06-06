# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=squash
_pkgver=1.0.9
pkgname=r-${_pkgname,,}
pkgver=1.0.9
pkgrel=4
pkgdesc='Color-Based Plots for Multivariate Visualization'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ff381c85071e3407574e3db28d789657f64e7d3f9d74ac123539de22ab8ac6f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
