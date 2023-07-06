# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastDummies
_pkgver=1.7.3
pkgname=r-${_pkgname,,}
pkgver=1.7.3
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
sha256sums=('cf6a182f778711b69460b00575babfa573f1578166d83ae2ed932db5fa15a06a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
