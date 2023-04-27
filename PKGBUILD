# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NanoStringQCPro
_pkgver=1.31.1
pkgname=r-${_pkgname,,}
pkgver=1.31.1
pkgrel=1
pkgdesc='Quality metrics and data processing methods for NanoString mRNA gene expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-knitr
  r-nmf
  r-org.hs.eg.db
  r-png
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2311cc7c51617cb54dc309af220cd4a9ff8a97b40fca5b76f6f942cfa111b7e2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
