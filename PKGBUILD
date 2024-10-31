# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellbaseR
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Querying annotation data from the high performance Cellbase web'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-biocparallel
  r-data.table
  r-doparallel
  r-foreach
  r-httr
  r-jsonlite
  r-pbapply
  r-r.utils
  r-rsamtools
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-gviz
  r-knitr
  r-rmarkdown
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44e0370f6f0cb39b316aefc757aedd6dab7a62d6fbde3d3055398acc648b8abe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
