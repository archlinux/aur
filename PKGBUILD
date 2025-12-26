# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPA
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
pkgrel=1
pkgdesc='RPA: Robust Probabilistic Averaging for probe-level analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-affy
  r-biocgenerics
  r-biocstyle
  r-phyloseq
  r-rmarkdown
)
optdepends=(
  r-knitr
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a26541a81d964a58359113ccc34a16efcb15b6e24462550a5009d2b9598ebe72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
