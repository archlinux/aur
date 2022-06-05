# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cp4p
_pkgver=0.3.6
pkgname=r-${_pkgname,,}
pkgver=0.3.6
pkgrel=3
pkgdesc='Calibration Plot for Proteomics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-mess
  r-multtest
  r-qvalue
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d21e6c0c194d1016eef953ac2da6880f7e51c17c8043ec7646e5b0fe49cadfd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
