# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastExpData
_pkgver=0.50.0
pkgname=r-${_pkgname,,}
pkgver=0.50.0
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
sha256sums=('8edeec553c6ff2fb314b7e640ae9647574aeba577929c8b73d832679101c8ac6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
