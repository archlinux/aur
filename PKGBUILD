# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=missForest
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1
pkgrel=1
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
  r-ranger
  r-rdpack
)
optdepends=(
  r-doparallel
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('895a13c10c694f3de3347d56988d8c69abe527e55cff2f83ebf128369de0739f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
