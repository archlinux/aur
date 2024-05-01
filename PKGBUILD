# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ELMER.data
_pkgver=2.27.0
pkgname=r-${_pkgname,,}
pkgver=2.27.0
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
sha256sums=('65a685b4283b14104ec66ea238e6e970b846df319cef6d3a7c8d115cb1e8121b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
