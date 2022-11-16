# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.core
_pkgver=3.3.0
pkgname=r-${_pkgname,,}
pkgver=3.3.0
pkgrel=1
pkgdesc="Core Methods and Classes Used by 'aroma.*' Packages Part of the Aroma Framework"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocmanager
  r-future
  r-listenv
  r-matrixstats
  r-pscbs
  r-r.cache
  r-r.devices
  r-r.filesets
  r-r.methodss3
  r-r.oo
  r-r.rsp
  r-r.utils
  r-rcolorbrewer
)
optdepends=(
  r-aroma.light
  r-cairo
  r-dnacopy
  r-ebimage
  r-expectile
  r-glad
  r-haarseg
  r-kernsmooth
  r-mpcbs
  r-png
  r-preprocesscore
  r-sfit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b6ab7cc6079f6783b0eaa2c10a29492e53cfb3f05b7a298588491b35a472188')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
