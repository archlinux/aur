# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RefManageR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=3
pkgdesc="Straightforward 'BibTeX' and 'BibLaTeX' Bibliography Management"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bibtex
  r-httr
  r-jsonlite
  r-lubridate
  r-plyr
  r-stringr
  r-xml2
)
optdepends=(
  r-knitr
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8300f65ab38425356fa0705356c5c00a37253737885ec6dfe2e7d719f314dce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
