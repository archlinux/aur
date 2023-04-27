# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CTDquerier
_pkgver=2.7.0
pkgname=r-${_pkgname,,}
pkgver=2.7.0
pkgrel=1
pkgdesc='Package for CTDbase data query, visualization and downstream analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocfilecache
  r-ggplot2
  r-gridextra
  r-igraph
  r-rcurl
  r-s4vectors
  r-stringdist
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7dce3965ce14a1b2bd5c8920538a3d28e48aa342c224948e7a6cce793a0af527')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
