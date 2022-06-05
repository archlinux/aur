# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clValid
_pkgver=0.7
pkgname=r-${_pkgname,,}
pkgver=0.7
pkgrel=4
pkgdesc='Validation of Clustering Results'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-annotate
  r-biobase
  r-go.db
  r-kohonen
  r-mclust
  r-moe430a.db
  r-rankaggreg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('037da469891462021eb177f9c9e18caefa8532f08c68fb576fae1668a1f451a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
