# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbec
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('589b35fe3e6d57f4d50f5877e6595e403994989e69c44d72353b8f3bed5a91a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
