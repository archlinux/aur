# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gistr
_pkgver=0.9.0
pkgname=r-${_pkgname,,}
pkgver=0.9.0
pkgrel=4
pkgdesc="Work with 'GitHub' 'Gists'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-crul
  r-dplyr
  r-httr
  r-jsonlite
  r-knitr
  r-magrittr
  r-rmarkdown
)
optdepends=(
  r-git2r
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('170ae025151ee688e7d31b9e49112086a8ddf4fef10155e9ee289ad7f28c8929')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
