# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ndexr
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=1.20.1
pkgrel=1
pkgdesc='NDEx R client library'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-httr
  r-jsonlite
  r-plyr
  r-rcx
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dbcb5b2ab5c719dac0f83a32fa63bb99b3536b9b58f7804d06abf530084cd754')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
