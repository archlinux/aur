# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbec
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Rbec: a tool for analysis of amplicon sequencing data from synthetic microbial communities'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-dada2
  r-doparallel
  r-foreach
  r-ggplot2
  r-rcpp
  r-readr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d4382c6ec3f39245551abf663cb440831464a5238a8be9cbe2b2579c95f1e72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
