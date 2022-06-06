# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=similaRpeak
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Metrics to estimate a level of similarity between two ChIP-Seq profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-r6
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-genomicalignments
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('505335c3854662b2ed4439fd82bb537bdf5cfc73d0ff85ce7fa883ceb9ab7391')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
