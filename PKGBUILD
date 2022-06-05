# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=crul
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=4
pkgdesc='HTTP Client'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-curl
  r-httpcode
  r-jsonlite
  r-mime
  r-r6
  r-urltools
)
optdepends=(
  r-fauxpas
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-webmockr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('be1a149b21cf219ef55adfb56a6a5eb9892a9acf0d5f5421a22e52f2a7066f8c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
