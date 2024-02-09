# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggseqlogo
_pkgver=0.2
pkgname=r-${_pkgname,,}
pkgver=0.2
pkgrel=1
pkgdesc="A 'ggplot2' Extension for Drawing Publication-Ready Sequence Logos"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-ggplot2
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1cbfd532032dd51316a1fa084bc8cdabe5517bc6ce7b3abafc0d94340e6736b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
