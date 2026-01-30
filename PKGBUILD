# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcmdrMisc
_pkgver=2.10.1
pkgname=r-${_pkgname,,}
pkgver=2.10.1
pkgrel=1
pkgdesc='R Commander Miscellaneous Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-car
  r-colorspace
  r-e1071
  r-haven
  r-hmisc
  r-nortest
  r-readstata13
  r-readxl
  r-sandwich
)
optdepends=(
  r-boot
  r-cardata
  r-datasets
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a83b5055f0cc1591dbe7a6b95f2ef827585a0d31032b808a5a28cc2c079c4b7f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
