# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PERFect
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Permutation filtration for microbiome data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-fitdistrplus
  r-ggplot2
  r-phyloseq
  r-psych
  r-sn
  r-zoo
)
optdepends=(
  r-ggpubr
  r-kableextra
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('495bb1d98f738498886285f66844f8d0f76caa65e5c5fc256242846b5d8eeb79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
