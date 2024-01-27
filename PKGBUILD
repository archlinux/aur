# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rfaRm
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=1.14.2
pkgrel=1
pkgdesc='An R interface to the Rfam database'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-data.table
  r-httr
  r-iranges
  r-jsonlite
  r-magick
  r-rsvg
  r-rvest
  r-s4vectors
  r-stringi
  r-xml2
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-r4rna
  r-rmarkdown
  r-runit
  r-treeio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b953d538843e8e4b4d0cc8b324b844096be065265277c279b51876ae2f1395e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
