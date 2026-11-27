# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellbaseR
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
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
sha256sums=('e5cdbbf8d55ea7651ee831d223d9f6231fb15926b7fb17c8b9845f65c2a19dd0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
