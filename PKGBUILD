# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annotationTools
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
pkgrel=1
pkgdesc='Annotate microarrays and perform cross-species gene expression analyses using flat file databases'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a1b0f9ac64c402f0de44b9c5a79f1deccaf1b4010dd989379043b5f889204b88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
