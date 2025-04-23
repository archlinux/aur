# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arules
_pkgver=1.7-10
pkgname=r-${_pkgname,,}
pkgver=1.7.10
pkgrel=1
pkgdesc='Mining Association Rules and Frequent Itemsets'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-generics
)
optdepends=(
  r-arulescba
  r-arulesviz
  r-pmml
  r-proxy
  r-testthat
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('76f5fb1ec610638db74bdb7e496761c8f24028d06d2d6a6315a4a93a15ce1266')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
