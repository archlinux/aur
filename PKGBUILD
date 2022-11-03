# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Guitar
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='Guitar'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-dplyr
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-knitr
  r-magrittr
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41d7134883403ee4ff79e14f13437b143a13d6280925e8e622255725d00e3c53')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
