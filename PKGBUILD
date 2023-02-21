# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocFileCache
_pkgver=2.6.1
pkgname=r-${_pkgname,,}
pkgver=2.6.1
pkgrel=1
pkgdesc='Manage Files Across Sessions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-curl
  r-dbi
  r-dbplyr
  r-dplyr
  r-filelock
  r-httr
  r-rappdirs
  r-rsqlite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('87a3d98cde0abcdbfa0c8e7a8f77eda78e39be712bc6edefcd85fa778b326198')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
