# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PPInfer
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Inferring functionally related proteins using protein interaction networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biomart
  r-fgsea
  r-ggplot2
  r-httr
  r-igraph
  r-kernlab
  r-stringdb
  r-yeastexpdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('80906cd6a89af64c1faf31ff1440a15f068019603332be5ef5d077b97a3e8943')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
