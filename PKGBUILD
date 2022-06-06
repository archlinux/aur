# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iC10
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=1.5
pkgrel=4
pkgdesc='A Copy Number and Expression-Based Classifier for Breast Tumours'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ic10trainingdata
  r-impute
  r-pamr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b471088158320778bac7b145233eeaaf9480061e2a5ac12c58ad7381caee06f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
