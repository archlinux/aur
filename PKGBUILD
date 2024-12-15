# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbec
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('d636e24d6603723ccbd66ea7ff8b1856e47e10eb193521f0efb0d7ad793e9b8a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
