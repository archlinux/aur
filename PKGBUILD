# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=varSelRF
_pkgver=0.7-8
pkgname=r-${_pkgname,,}
pkgver=0.7.8
pkgrel=4
pkgdesc='Variable Selection using Random Forests'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-randomforest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('719487fb560cb4733816bafe4cbc958a132674825e3b9d4f82ce8f2003cd8940')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
