# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Mm.eg.db
_pkgver=3.15.0
pkgname=r-${_pkgname,,}
pkgver=3.15.0
pkgrel=3
pkgdesc='Genome wide annotation for Mouse'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c658df080feb03fedfcbb5f772f3683ff7272b2de3deee055292005b3093d78a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
