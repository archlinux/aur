# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spikeLI
_pkgver=2.60.0
pkgname=r-${_pkgname,,}
pkgver=2.60.0
pkgrel=1
pkgdesc='Affymetrix Spike-in Langmuir Isotherm Data Analysis Tool'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('051d4f9a790aaa89171f374106c1aca23b9a42947c304aa664f281a5e2250256')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
