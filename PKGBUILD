# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Bioconductor-specific package checks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-biocmanager
  r-biocviews
  r-graph
  r-httr
  r-knitr
  r-stringdist
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-biocstyle
  r-callr
  r-devtools
  r-downloader
  r-jsonlite
  r-rmarkdown
  r-runit
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c949052b2d4ed39d945f79f33dbbd2572c6a076c43f8daa65226c2994997c495')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
