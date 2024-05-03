# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChromHeatMap
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='Heat map plotting by genome coordinate'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-rtracklayer
)
optdepends=(
  r-all
  r-hgu95av2.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0fd759ebd277c4135e36c0832ed232903930ae1124bc424d9c8e1f998de8f9cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
