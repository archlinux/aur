# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=rio
_pkgver=0.5.30
pkgname=r-${_pkgname,,}
pkgver=0.5.30
pkgrel=1
pkgdesc='A Swiss-Army Knife for Data I/O'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-curl
  r-data.table
  r-haven
  r-openxlsx
  r-readxl
  r-tibble
)
optdepends=(
  r-arrow
  r-bit64
  r-clipr
  r-datasets
  r-feather
  r-fst
  r-hexview
  r-jsonlite
  r-knitr
  r-magrittr
  r-pzfx
  r-readods
  r-readr
  r-rmarkdown
  r-rmatio
  r-testthat
  r-xml2
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8087b14ab7e26c653b6cb161503a146aee5a53edc6c703311ef5cedf236f1746')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
