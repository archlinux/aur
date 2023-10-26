# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIC.data
_pkgver=1.21.1
pkgname=r-${_pkgname,,}
pkgver=1.21.1
pkgrel=1
pkgdesc='ChIC package data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-genomeintervals
  r-randomforest
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c066fff73a898d14c10f72233938d1f98a16510821f716b4d80070dd9c0571d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
