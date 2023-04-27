# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RandomWalkRestartMH
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Random walk with restart on multiplex and heterogeneous Networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dnet
  r-igraph
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('033a32671f6636e0899815f6b5df3b0976b5d43a010508c6661e9f630c03a572')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
