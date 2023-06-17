# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=1.36.1
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
sha256sums=('6c192202d6f779ea31fc04a87e2353bbc133495eab6ac42d7d71044b71b50e28')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
