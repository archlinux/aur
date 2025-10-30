# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethylMix
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='MethylMix: Identifying methylation driven cancer genes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-digest
  r-foreach
  r-ggplot2
  r-impute
  r-limma
  r-r.matlab
  r-rcolorbrewer
  r-rcurl
  r-rpmm
)
optdepends=(
  r-biocstyle
  r-doparallel
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1b5f7e981b75d80f1c09458d27b88182dfa9bbf1d5e5a655e66734db24c2b5f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
