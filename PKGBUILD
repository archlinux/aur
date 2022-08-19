# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RefManageR
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=6
pkgdesc="Straightforward 'BibTeX' and 'BibLaTeX' Bibliography Management"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-httr
  r-jsonlite
  r-lubridate
  r-plyr
  r-stringr
  r-xml2
)
optdepends=(
  r-bibtex
  r-knitr
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fa3aec38cee95d7a75d79078a7b397fc08086fe3d0e2aed8f24d9468cb6dffea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
