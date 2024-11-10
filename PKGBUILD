# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SpectralTAD
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='SpectralTAD: Hierarchical TAD detection using spectral clustering'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-dplyr
  r-genomicranges
  r-hiccompare
  r-magrittr
  r-primme
)
optdepends=(
  r-bioccheck
  r-biocmanager
  r-biocstyle
  r-covr
  r-knitr
  r-microbenchmark
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd40ce22d694d3bea888e1197998cf3a0a3124d85669da4836376ae585bbbd4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
