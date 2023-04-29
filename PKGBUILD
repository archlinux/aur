# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hpar
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Human Protein Atlas in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-experimenthub
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-dplyr
  r-dt
  r-go.db
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('91dc039eddd359b45444d164736e25b21fe754d4ddcc01fb084a1cd594ace0e9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
