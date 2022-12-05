# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survivalROC
_pkgver=1.0.3.1
pkgname=r-${_pkgname,,}
pkgver=1.0.3.1
pkgrel=1
pkgdesc='Time-dependent ROC curve estimation from censored survival data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8174afebaf239dfda979c8c7e1e219624576d577c983ae787fbd2785b4ccd15c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
