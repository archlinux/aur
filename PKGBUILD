# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=googleVis
_pkgver=0.7.0
pkgname=r-${_pkgname,,}
pkgver=0.7.0
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
sha256sums=('5f1636024e678f9973e3ce605b46f46ea9cdffd58b98e315b495e66f34eb02e9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
