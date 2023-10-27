# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rgsepd
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Gene Set Enrichment / Projection Displays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-deseq2
  r-go.db
  r-goseq
  r-gplots
  r-org.hs.eg.db
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-boot
  r-knitr
  r-tools
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('92f48a2c30b434ac58cea1e20eb8c4d7451809d2e4f9f6e5d63089b5a03130bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
