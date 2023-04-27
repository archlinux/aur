# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dr.eg.db
_pkgver=3.17.0
pkgname=r-${_pkgname,,}
pkgver=3.17.0
pkgrel=1
pkgdesc='Genome wide annotation for Zebrafish'
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
sha256sums=('6edf0466882fe77349f24cfcb15bfe06a036cb9956e15021dc0f67813d2cc251')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
