# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mvoutlier
_pkgver=2.1.4
pkgname=r-${_pkgname,,}
pkgver=2.1.4
pkgrel=1
pkgdesc='Multivariate Outlier Detection Based on Robust Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-robustbase
  r-sgeostat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa6e8e8789e7a6f9d24e26948438a4060c69c108dfa64919781d2292e514536d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
