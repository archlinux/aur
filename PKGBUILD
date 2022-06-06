# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spikeLI
_pkgver=2.56.0
pkgname=r-${_pkgname,,}
pkgver=2.56.0
pkgrel=1
pkgdesc='Affymetrix Spike-in Langmuir Isotherm Data Analysis Tool'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c4215c6bd65c6e78eebc8117a16deb221acca80e50633edce8248da5063a5eea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
