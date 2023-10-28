# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPA
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
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
sha256sums=('d48b0880d1601a18ae8e69104e4059321a533d9b3617ebec9cab117e02cb5250')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
