# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVrd2
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='CNVrd2: a read depth-based method to detect and genotype complex common copy number variants from next generation sequencing data.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dnacopy
  r-ggplot2
  r-gridextra
  r-iranges
  r-rjags
  r-rsamtools
  r-variantannotation
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('669355b49658ad9f61d75682d82507271f5a0f89ada7c8c6ee28e67b94407acd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
