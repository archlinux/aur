# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epidecodeR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='epidecodeR: a functional exploration tool for epigenetic and epitranscriptomic regulation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-envstats
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-iranges
  r-rstatix
  r-rtracklayer
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1035e589a7240ab000531ab32c67a5b4c9711fc3ab0a0e077e81f5b4cd1482a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
