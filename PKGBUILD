# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ff
_pkgver=4.0.12
pkgname=r-${_pkgname,,}
pkgver=4.0.12
pkgrel=1
pkgdesc='Memory-Efficient Storage of Large Data on Disk and Fast Access Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bit
)
optdepends=(
  r-biglm
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08af355a9a10fe29d48d085abc7cf1f975e1a4a670668a4f8d9632d087fb41bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
