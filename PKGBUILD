# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rfaRm
_pkgver=1.19.0
pkgname=r-${_pkgname,,}
pkgver=1.19.0
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
sha256sums=('4bbc8f5eb68773d3666d23b605d25386f58b0b9f2178f4797ccdcf75901cbf79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
