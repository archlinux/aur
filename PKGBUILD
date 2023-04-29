# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scMAGeCK
_pkgver=1.9.1
pkgname=r-${_pkgname,,}
pkgver=1.9.1
pkgrel=4
pkgdesc='Identify genes associated with multiple expression phenotypes in single-cell CRISPR screening data'
arch=('x86_64')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('BSD')
depends=(
  r
  r-ggplot2
  r-seurat
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e6da2a50930d7e436a519eba780de746289a2e6228854c7c4ca9896bb44d4c4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
