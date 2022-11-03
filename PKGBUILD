# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastExpData
_pkgver=0.43.0
pkgname=r-${_pkgname,,}
pkgver=0.43.0
pkgrel=1
pkgdesc='Yeast Experimental Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
)
optdepends=(
  r-biobase
  r-go.db
  r-org.sc.sgd.db
  r-rbgl
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('820579f5a67eb4d5389b31759852ef8f60208e1f2699e07022a2aa07fbfdb5ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
