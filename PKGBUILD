# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MACSQuantifyR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('a1e9a9c20333d22f719a0d7bf6da85a8a07282ece3b87f295fc9756ac0943d79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
