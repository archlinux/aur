# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=atena
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=1.2.2
pkgrel=1
pkgdesc='Analysis of Transposable Elements'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rsamtools
  r-s4vectors
  r-sparsematrixstats
  r-squarem
  r-summarizedexperiment
  r-annotationhub
  r-scales
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('177eb89602bf4d7c50d4ccce7c1732a7c5c72fb20d19649a448c10c6cee2092d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
