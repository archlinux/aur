# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffcoexp
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Differential Co-expression Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-diffcorr
  r-igraph
  r-psych
  r-summarizedexperiment
  r-wgcna
)
optdepends=(
  r-geoquery
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9a4395b75d78665964e8a0c0fb11ef874c6ac8807b7aac13f4a7ffa6f960a83f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
