# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VCFArray
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Representing on-disk / remote VCF files as array-like objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-genomicfiles
  r-genomicranges
  r-rsamtools
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-seqarray
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('60e2baf8c3c4225f8460050020050ab2e89971f79a23fa4be407e29b74fbe01f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
