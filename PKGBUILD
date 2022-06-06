# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastDummies
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=1.6.3
pkgrel=4
pkgdesc='Fast Creation of Dummy (Binary) Columns and Rows from Categorical Variables'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-data.table
  r-stringr
  r-tibble
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd3934fe19d7dff2723438bbb7b89334118143f8ce151d98477ae964ee5d81df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
