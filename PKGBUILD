# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=officer
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=3
pkgdesc='Manipulation of Microsoft Word and PowerPoint Documents'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-r6
  r-uuid
  r-xml2
  r-zip
)
optdepends=(
  r-base64enc
  r-devemf
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-rsvg
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('20f802272bc066370d5afe98f4127047edb672b48a2effe363f12798b530b662')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
