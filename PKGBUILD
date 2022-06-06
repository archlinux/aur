# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnsDb.Hsapiens.v86
_pkgver=2.99.0
pkgname=r-${_pkgname,,}
pkgver=2.99.0
pkgrel=3
pkgdesc='Ensembl based annotation package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ensembldb
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('552c07bcc2a1420089d4330deafaeb5303e03d0fa75c96b78075dfd67eeee7be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
