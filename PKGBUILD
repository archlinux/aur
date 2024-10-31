# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMRcaller
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Differentially Methylated Regions caller'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-betareg
  r-genomicranges
  r-iranges
  r-rcpp
  r-rcpproll
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25273c9aa71a4e5d3b6884352fa57a30fb567b6c22d78ae64bb41ae47d8e1b7e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
