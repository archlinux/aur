# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mCSEAdata
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Data package for mCSEA package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f0ccac51b0d4e2aaf724fc0270835279af9a7780986e41c8dc1bdbae167b6af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
