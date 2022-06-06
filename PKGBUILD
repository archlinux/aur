# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rentrez
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=1.2.3
pkgrel=4
pkgdesc="'Entrez' in R"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-httr
  r-jsonlite
  r-xml
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb256597ebe7780e38bef9c4c2626b3feacd60c7a5a29fc6a218cf0d8d132f74')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
