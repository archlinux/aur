# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=anyLib
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=3
pkgdesc='Install and Load Any Package from CRAN, Bioconductor or Github'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biocmanager
  r-curl
  r-devtools
  r-httr
  r-withr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('759b53ecc58136458220108a72004f360404ad2769cbf6ead48dcf09212a3df5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
