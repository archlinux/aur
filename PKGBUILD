# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gCrisprTools
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Suite of Functions for Pooled Crispr Screen QC and Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-complexheatmap
  r-ggplot2
  r-limma
  r-rmarkdown
  r-robustrankaggreg
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-biocgenerics
  r-edger
  r-fgsea
  r-knitr
  r-markdown
  r-msigdbr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-runit
  r-sparrow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a91d225472676d23bb069f595705e2f76f4c06024c1d161b69b7a7822445f503')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
