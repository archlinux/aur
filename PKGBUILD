# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=googleVis
_pkgver=0.7.1
pkgname=r-${_pkgname,,}
pkgver=0.7.1
pkgrel=1
pkgdesc='R Interface to Google Charts'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-jsonlite
)
optdepends=(
  r-data.table
  r-httpuv
  r-knitr
  r-markdown
  r-rmarkdown
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('335931059ea8645f824b01a06d30fafb4e38b47cd610a5eee20628801767f218')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
