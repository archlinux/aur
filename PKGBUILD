# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pairkat
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='PaIRKAT'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-compquadform
  r-data.table
  r-dplyr
  r-igraph
  r-keggrest
  r-magrittr
  r-s4vectors
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe47d0150914e934ddc6cb2b5570a00b97c178905a9f087b072366b7561d9115')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
