# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastExpData
_pkgver=0.55.0
pkgname=r-${_pkgname,,}
pkgver=0.55.0
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
sha256sums=('7e0a1800edd01d6739d0d52bb71e52308ea53a3d28f53086361823260ae96dba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
