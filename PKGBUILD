# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rentrez
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=1.2.4
pkgrel=1
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
sha256sums=('22dda569f264128b5e86aa0ed6e9a5a11e489bbc01ac55300a272c8cd233e180')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
