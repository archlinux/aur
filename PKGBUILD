# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ABarray
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=1.78.0
pkgrel=1
pkgdesc='Microarray QA and statistical data analysis for Applied Biosystems Genome Survey Microrarray (AB1700) gene expression data.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-multtest
  tk
)
optdepends=(
  r-limma
  r-lpe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fd3ad2774a79049cb70b02ced74ae39b7c0148a379697f082e9b401f3f721079')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
