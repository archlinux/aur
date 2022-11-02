# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MACSQuantifyR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Fast treatment of MACSQuantify FACS data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-latticeextra
  r-png
  r-prettydoc
  r-readxl
  r-rmarkdown
  r-rvest
  r-xml2
)
optdepends=(
  r-knitr
  r-r.utils
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f72286990e2e6f7a154fafb1e141aed07c7a5d5a91d02860feeb7a67953bb8d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
