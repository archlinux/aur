# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cleaver
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Cleavage of Polypeptide Sequences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-brain
  r-knitr
  r-rmarkdown
  r-testthat
  r-uniprot.ws
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('110819cdcad7087ec223f89fb57b767dcd832ea0de5f3fbe1db5f71a9a2b0f2e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
