# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiRData
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=1
pkgdesc='miRNA Affinity models for the scanMiR package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-scanmir
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cfd74176fc579391c94552c9be0b1fbc37ad3eeb11f494e1157a54f2f5e1320e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
