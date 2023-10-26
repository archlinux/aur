# system requirements: Java (>= 1.8)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sarks
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Suffix Array Kernel Smoothing for discovery of correlative sequence motifs and multi-motif domains'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-binom
  r-biostrings
  r-iranges
  r-rjava
)
optdepends=(
  r-biocgenerics
  r-ggplot2
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44505679b8e74c320cdf3518130525991eb86abc4e9c419bf9f5cfd32600f80f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
