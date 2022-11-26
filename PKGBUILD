# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=missForest
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=1.5
pkgrel=6
pkgdesc='Nonparametric Missing Value Imputation using Random Forest'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dorng
  r-foreach
  r-iterators
  r-itertools
  r-randomforest
)
optdepends=(
  r-doparallel
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('417055a03b02ad8359cf1bdc8f89d49531a3a8ee2c98edf90c8a01432f44838d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
