# system requirements: java (>= 1.6)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xlsx
_pkgver=0.6.5
pkgname=r-${_pkgname,,}
pkgver=0.6.5
pkgrel=3
pkgdesc='Read, Write, Format Excel 2007 and Excel 97/2000/XP/2003 Files'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rjava
  r-xlsxjars
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-rprojroot
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('378c5ed475a3d7631ea1ea13e0a69d619c1a52260922abda42818752dbb32107')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
