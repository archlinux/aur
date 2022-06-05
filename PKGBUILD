# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adSplit
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
pkgrel=1
pkgdesc='Annotation-Driven Clustering'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-go.db
  r-keggrest
  r-multtest
)
optdepends=(
  r-golubesets
  r-hu6800.db
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5592bc37a071e61db845f64f3a5f56e981eb5567c770ca0a222ecfb3407b82f2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
