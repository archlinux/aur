# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FitHiC
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Confidence estimation for intra-chromosomal contact maps'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-fdrtool
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a778a89742a5f7a8bc86df079dfc48ca870a0d326a22e735a1d4da0ef93cd98')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
