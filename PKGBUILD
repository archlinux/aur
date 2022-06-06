# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRmine
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Data package with miRNA-seq datasets from miRmine database as RangedSummarizedExperiment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0ce6df61299795f7abd37a6279a7341b2b80f7b48a7579881a3f99d141493921')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
