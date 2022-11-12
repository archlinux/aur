# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rorcid
_pkgver=0.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Interface to the 'Orcid.org' API"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-crul
  r-data.table
  r-fauxpas
  r-httr
  r-jsonlite
  r-tibble
  r-xml2
)
optdepends=(
  r-handlr
  r-httpuv
  r-knitr
  r-rcrossref
  r-testthat
  r-vcr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f94551147a42ab6579bbfab9c2245aaa466d012fb813664509d2eb89082f1ab4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
