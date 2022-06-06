# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poorman
_pkgver=0.2.5
pkgname=r-${_pkgname,,}
pkgver=0.2.5
pkgrel=5
pkgdesc="A Poor Man's Dependency Free Recreation of 'dplyr'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-pkgdown
  r-rmarkdown
  r-roxygen2
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b92b30ce0f4f02c4fa4a4e90673ef2e0ed8de9b9080dd064506581989fcc0716')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
