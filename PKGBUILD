# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ELMER.data
_pkgver=2.23.0
pkgname=r-${_pkgname,,}
pkgver=2.23.0
pkgrel=1
pkgdesc='Data for the ELMER package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
)
optdepends=(
  r-biocstyle
  r-devtools
  r-dplyr
  r-dt
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b01535f707a427b865d59f346f673efe0eb8c6caa1a90482afcc1099e0c1b570')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
