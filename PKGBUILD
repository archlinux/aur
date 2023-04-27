# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetScore
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='TargetScore: Infer microRNA targets using microRNA-overexpression data and sequence information'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-pracma
)
optdepends=(
  r-biobase
  r-geoquery
  r-gplots
  r-targetscoredata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3b8c3a9ade963bd66dd88cce60152c206d0411574fc41d68dbd70a1fa7173d87')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
