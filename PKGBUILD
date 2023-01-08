# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=officer
_pkgver=0.5.1
pkgname=r-${_pkgname,,}
pkgver=0.5.1
pkgrel=1
pkgdesc='Manipulation of Microsoft Word and PowerPoint Documents'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-openssl
  r-r6
  r-uuid
  r-xml2
  r-zip
)
optdepends=(
  r-base64enc
  r-devemf
  r-doconv
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-rsvg
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9cc0756c3a5b51e8e112759a86cde0b946b6b45d22ced95b1cfe0a55112c08e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
