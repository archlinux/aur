# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coop
_pkgver=0.6-3
pkgname=r-${_pkgname,,}
pkgver=0.6.3
pkgrel=4
pkgdesc='Co-Operation: Fast Covariance, Correlation, and Cosine Similarity Operations'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-matrix
  r-memuse
  r-slam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('40904e172812c14810f83bc7ee7f6e3fc768fae268208fb3b14f73f5b44e8973')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
