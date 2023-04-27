# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GDSArray
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Representing GDS files as array-like objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-gdsfmt
  r-s4vectors
  r-seqarray
  r-snprelate
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9c9094479c56ea6f7f46f99e3a4e82445447566b5ada1cb847203302a4e1555c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
