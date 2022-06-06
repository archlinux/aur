# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NADA
_pkgver=1.6-1.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1.1
pkgrel=4
pkgdesc='Nondetects and Data Analysis for Environmental Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('670ff6595ba074ed0a930b7a09624d5ef20616379a20e768c1a7b37332aee44a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
