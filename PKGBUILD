# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=metaboliteIDmapping
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Mapping of Metabolite IDs from Different Sources'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
)
optdepends=(
  r-conflicted
  r-dplyr
  r-graphite
  r-knitr
  r-magrittr
  r-r.utils
  r-rappdirs
  r-readr
  r-readxl
  r-rmarkdown
  r-sets
  r-stringr
  r-tibble
  r-tidyr
  r-utils
  r-xml
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('148fd847cf4609086d1e9a175712645182d9a7e4bc28a99e88c8f2a1e8bed459')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
