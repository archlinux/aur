# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocFileCache
_pkgver=3.4.0
pkgname=r-${_pkgname,,}
pkgver=3.4.0
pkgrel=1
pkgdesc='Manage Files Across Sessions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r-curl
  r-dbi
  r-dbplyr
  r-dplyr
  r-filelock
  r-httr2
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
sha256sums=('80e9aec065a091923bf85691d8eda8757bee45aa0f4d5b01089e1b10c677d6a2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
