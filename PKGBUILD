# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=apcluster
_pkgver=1.4.13
pkgname=r-${_pkgname,,}
pkgver=1.4.13
pkgrel=1
pkgdesc='Affinity Propagation Clustering'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5e975baa427def9944ec0a3ea5f8f92f4ebce4e98689b4019525d25b54d5a1a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
