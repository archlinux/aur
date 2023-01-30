# system requirements: libprotobuf and protobuf-compiler
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=protolite
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Highly Optimized Protocol Buffer Serializers'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-jsonlite
  r-rcpp
  protobuf
)
optdepends=(
  r-curl
  r-sf
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('31e6766ee0bbaff8219ec693de7ae38028c56e5fb4534f714f4acc1c07e118af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
