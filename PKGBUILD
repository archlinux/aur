# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChAMPdata
_pkgver=2.31.0
pkgname=r-${_pkgname,,}
pkgver=2.31.0
pkgrel=1
pkgdesc='Data Packages for ChAMP package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomicranges
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f201fd889c6f629d5999244db80a8b47b92df19dfb0e2be4e19d2ae39e834d73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
