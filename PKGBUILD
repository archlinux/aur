# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metap
_pkgver=1.11
pkgname=r-${_pkgname,,}
pkgver=1.11
pkgrel=1
pkgdesc='Meta-Analysis of Significance Values'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mathjaxr
  r-mutoss
  r-rdpack
  r-tfisher
  r-qqconf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('34e8c9fc3ccaae23f57389001987de02339416f843084869f92ff635052093b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
