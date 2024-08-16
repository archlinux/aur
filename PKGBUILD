# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastDummies
_pkgver=1.7.4
pkgname=r-${_pkgname,,}
pkgver=1.7.4
pkgrel=1
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
sha256sums=('95904d4b67efc3faafa47cae9473c9d75653bc3fb6ad0083869ebf9f7960dd08')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
