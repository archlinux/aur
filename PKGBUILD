# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethylMix
_pkgver=2.38.0
pkgname=r-${_pkgname,,}
pkgver=2.38.0
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
sha256sums=('bebdc3ca194fc25a6b01708dd63a2677f24b965afa802a9bd59495432b9dd482')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
